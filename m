Return-Path: <linux-arm-msm+bounces-102137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHa1Fjvk1GlMygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:02:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B87663AD6F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73AC3300A133
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D600E3AB269;
	Tue,  7 Apr 2026 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuNfqLdL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQ2V7JzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAE33A451D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559532; cv=none; b=lAnDuGn7I3qACXBa0Q/Mt2agNKAYTxwh5Aon/LPZ9Dfk4X2m3DfHVOmd3H1HVhjz+g1aWW64mcn+h3ysDJ6GbJI9qXb+a1S3Sn99ce1dM5Lij2wrB2uPp/xscVVispE2XqdJ58JDlQjItdDsyL6zQVOs6rXmaJYqFsDV77fFKgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559532; c=relaxed/simple;
	bh=ktd0UMKrWaUcaGo9fGCGeM2xyR0ggRBULf7rZkDfsJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMhJrYL3GcQvAuRk92cPI+mbPk74WD+vSrfQRlUZBF5YIpW8MDZnq9rS+BUmKw2weHATYOrV73bAwh4fSoXfMoxPN7nLuI/fpO7mXuAHQwH53UY/B0AmHqwpEZJbG3xZ54OoT9oyebOmJUqPLcTDBEmjeX9DcpPMg+6Cs4ZKijU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuNfqLdL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQ2V7JzQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376nbXw1584376
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCqoU7bXs+Nx06yOgLyROTLNdQZVS+xm+B7KV7N4LaA=; b=DuNfqLdLPfpY9fuI
	IaW6JM0lfNzRIBGXtDbl3ClI8f8VPe1vhrEd48ub2yIQzfE1zpySKJDUaZDe8vJ4
	v3X04CVzc5/ch07d5Ztp4tyGgN+o6UABKXDkjI+akYJgAAlIhRj7LSJcQ7BKbQUy
	sf9O1gz+ODmSWi2eT26hub6Jjm03lR/iyiuAFXk829LWp9LCd7r4PUO5WxexCqQq
	gacStpQSt3lN9C0pF6geRBqWwH4SaiId+LZetqf0gNc7sYrTKaWr1VpzPCMkOKKb
	RgnuUaKY6NskRp4tNpqEVYe5oEsl7ozZoRCDp9v5mNXkr+s1xrKRkeZovCFrtkHf
	gUqnmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9tcxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:58:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d7128e038so10408681cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559530; x=1776164330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCqoU7bXs+Nx06yOgLyROTLNdQZVS+xm+B7KV7N4LaA=;
        b=RQ2V7JzQyzxNDR1d9hvsfQeEkZSafPoPsP0RSr1IyPm4NoMPgFHQPgYdcg82y8PyTz
         cZ24R7zcMfdKxe98Dkb0Tt8rK6fctaAV8HO6HSCPhozu357CHeYQciDvJ1CSZ8NA1jqV
         oXPI7wZbSbfm42CF2zGKcJpSsDrY1gI4NJXvLxcfPUazdm9ncTKkmMKqn4WfKq0e4G8+
         9PnjjIBiSL2vOVWDwBTFNjMe062mzkOUeS6SNJQQ3Tcdgt89+/owXjp2ciF6dMIV0LXJ
         K6+eVMfdcT5ObmRWvbY3FRrPl/QvZm6aH5sssqqhprUkKsZ9b9M+eID/7G7ZGOHHiAWF
         Uggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559530; x=1776164330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCqoU7bXs+Nx06yOgLyROTLNdQZVS+xm+B7KV7N4LaA=;
        b=Gc0l73e4PQrOU1U1AqbhMfoY2u60/MNYagVx5vzMQF2fv1jXhqp8NZlzvUC1bEzK+x
         EdXHtmnzQqKo/JKMHqSfgSX8QkiQ6Oo/U8AJsThOVO+Kxj1UGuLw3rY+sl2TmpkbJBkf
         8vzU9vS4Fhl4/OTQdr8WvKzd9VydWXODA9YDi9PpPbs8Gclg+I8xT9I7YCSzXFvHNplO
         H4gVeU0MDky3tdL2Q47z4PuTJYaiskHkI9PWgbWv5rmUq28CenQQLEqxQSuSHbAOzxU5
         xcaECgYP8KI9OXPea7CUU3QkP+JjsRVVfv7FDBx0Jp9XbuDt2WF7XDxa55qiyZtVD677
         1SEA==
X-Forwarded-Encrypted: i=1; AJvYcCWteGUHPcGlwGfD0RjV0Anxio3iqTQm7hbPynMQInoPq4TZrWriHcISEgCzdoy8qFmQFGFbVOzEI48AGORi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9wyPimqrrRnx1JiCCIGa8ci3A0MaAVfE8a4cA/vIKTnlaV1z6
	cQ2g3cLCi8gVzzC1RCqfz4fHxwoSzvQjNl1bTi6O6X0851zedMMJvh2n6ZlUpfbufbTRa6B1RTg
	hnlnSN5kFt45n2rK25DBpRolSHYsDVcvpgxx8AAl8/KezLPvUWV9EvEnGBCF295Mx/JTe
X-Gm-Gg: AeBDietKu8agr/MISfL9GUiWgKH2ciWneqnaimdxzX68pBn/VKHD2RSH9W5QcwxN1ML
	g1NO6TjnyQ/PJUejZVxIAn2w6OoplpDTfZOS24+lJ1fObe2p1Q6232+TQfEOro3c6ybEIwN+Sur
	E+70xK0d5sU75ByM4ZtHvGFpD+SunyYu/nG50gxsQIXjwyEyiBhVJ2Cf8+I154djsowzbGUu9cX
	Y55PsXxYqJwouwQh/ocGafb4D65ephv4D52HgrjfI677Dp65QyWtzRbjFHEt0refmgQ+gP31NSI
	oi7enn4Jcv4thzLVL/NB3wq3NV2UhLXmMsUp+vKJq/NG14w22G4jAOaEU0nIwehvW7/75ZS84VP
	zsTyCA1GGvcthbRf385jELZ9JKcrc48r2qq/v41co/Dex1hc8TeBwzKOGvTe/h1yP3h26tXfawD
	eMSrM=
X-Received: by 2002:a05:622a:2b06:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50d62b13243mr181986991cf.2.1775559529864;
        Tue, 07 Apr 2026 03:58:49 -0700 (PDT)
X-Received: by 2002:a05:622a:2b06:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50d62b13243mr181986691cf.2.1775559529370;
        Tue, 07 Apr 2026 03:58:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec58f1sm552059566b.33.2026.04.07.03.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:58:48 -0700 (PDT)
Message-ID: <c72e02c7-57d8-4353-a6d8-9dbf4f7a7e37@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:58:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4e36b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=B7wDQo7gvYI_MMBIZEwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMiBTYWx0ZWRfX/5AFndn6xvfr
 6hpZ1Mt9OcMIK/3qBeYLt5kGzHZMmOvtfTSmIXoZi5TjyULM2SXLV7Ru9zfFEHIoKJ0CWt1pF+g
 gEf2cQdqkbKQjaOoQO/4qfd3uVleRo0CRoFGMnyjeGzkYHY2ivQzo5sqg2RZcBGw0ClpHaKOfnr
 rqXqUgUiX1HYVECrhkjS3BV1Db7/du0rg1rIVjmy7sQnFop0P+q539i6pQFbKWZpxb2zIiCxKTH
 7EnGJqPjknIgULvv5doN9TB09GEvlpykptytXfc9cghjwK9Zr5h8mfCv9xo6hpnvx/4RGkn3F6y
 njQ8cFA22xtem5zPW/xaExpX2TK8D+XjR+Tl1+vZJYVNkMhcmPzfO2FEoa4OKzk6KAjw+eEZl3R
 cjTPNM6/CapQ5oc+BqeU4I/WQkMJcgBHyzBXVMJt90JOlmPZw3N32YLXZ8TlDg4M2GbuJM/SzZs
 94rfm0vgyv+Rr/DVJRQ==
X-Proofpoint-GUID: SOsB3JZi2ylYdyFnWvZ602OEIoEbiT5m
X-Proofpoint-ORIG-GUID: SOsB3JZi2ylYdyFnWvZ602OEIoEbiT5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102137-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B87663AD6F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 11:30 AM, Taniya Das wrote:
> When the clock controller is probed with 'use_rpm' enabled, the
> runtime PM reference is currently released using pm_runtime_put(),
> which may return before the runtime suspend has completed. This
> can leave the power domain transition in progress while the probe
> path continues or returns.
> 
> Use pm_runtime_put_sync() instead to ensure the runtime PM “put”
> completes synchronously during probe, guaranteeing the device is
> fully runtime‑suspended before returning.

It's not immediately obvious why that's an issue, is there an
observable problem when the transition doesn't complete in time?

Konrad

