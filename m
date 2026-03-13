Return-Path: <linux-arm-msm+bounces-97409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOQRAvbms2nZcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:29:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3BC281700
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FB973012C51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CFB38E12B;
	Fri, 13 Mar 2026 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7pWufAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSv/dcU2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262AB38D00C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397713; cv=none; b=OIQF+sQICiR+LG0s9pW0NG/Y7hxg2+ctOkBzdb0Wcm46jNrDSU+Istt0qoQB3Q6M3jqJUCzhhyFv0QOwRs1gyhq3/mEA846NTV+/eTJW9qct9hKAVlPUOZvFIRQvgFZHxq/whp2SYzSnQlme7SpWL18Zu/ug0hQ8d2PnAqnZ7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397713; c=relaxed/simple;
	bh=48VeePj7qZYMNDTxDzjnLA0VHWVsiMvXvJFGS1r6GBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGpeFdnI+XS3i79Ppj6Xa+Gp91FUSTaLl+QUa/HJ0DUX/+aYOpNf9xbh8atvAZULiF6gLiiYjludidXPX76k51JmDzky/ulpahMNq5vfcUzkB1KO1FWny0N76DHpJhyrXUtFWrf4JjvQaEejHAjkYnzMLUItXescJ9Ocwi+nx/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7pWufAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSv/dcU2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iMmd2262606
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fyC8EkpBaiEoOs4Wwbk5hxiQqHnnTfsVCZLncu5TuYA=; b=R7pWufAAjfaSwdQ9
	tX6Kmf2tX7wGCUXeDV6OdFi5HVQ27IDpyhFAMTG/vveIfv/ErfsjUKZUC+PXYSv6
	WLVL0lDvRh3JHKzQTOQkNfG/gg23j31OuTl3InKt31/lMsB0gztuh3c+cTksL50v
	1PioZEh5YBo4H/rJ0+vMOidvIGsvpOYaSf/Azp3VplEg5RORqIXQnOqqqQnEbk4w
	fAE6iQ7614cLN+34WZVHuerUCeHJHOX0fwfctgb+9bBCQ56kzKcLL9StptI63ygN
	WcgiUZOLyy7CX6oZuJrWaExwEQ/D7ohF2La8YwEyaKjHSZXWeklPp16HlRtzvae2
	aaggIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4rk7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:28:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8ea43d4eso85781085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397710; x=1774002510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fyC8EkpBaiEoOs4Wwbk5hxiQqHnnTfsVCZLncu5TuYA=;
        b=PSv/dcU2SK33j6HqXR2IaefKwZBhNJrIT3XDXTlD1xroK+/C2DRBJ3OSdmvHJlV4Eb
         VJmgPqcqkNp6byJEGAUefdq6TJmK3yYnsixU4urWwgUN2x+uqe+Bz+mipaS32mn783z3
         eZfrOQNoV1rBXZj3LyAnfwKRKRs13HjNJAOxtiYvVRgGiGUsvtZoQ4Qk6rSi37rxVdZ9
         IomTrqrM4puRA7BaWfzocqfc6DIfp3rfG7gXBfWOpcQTRZm9ZVFcOkJt8os25lYRP3tp
         L3TjzHduOUuY1hNWUPHf7fisQJMN6mh3/H8WgUrVAB2GOFi+JE8eBbyDCQF7vsWoHXNm
         gt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397710; x=1774002510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyC8EkpBaiEoOs4Wwbk5hxiQqHnnTfsVCZLncu5TuYA=;
        b=Bw4Llh8zfyrSavaKW/EIGu2EI8cq6mnKaoUlORbRTtpe0ffSQCV7uWA24ld/wkDxd1
         FSUv/0JoTKfSrYNEasgfWcS7eQ2IN4NsLEb4QyzL+nAJ7QP5n+4kAyXw1a7eQkTJ60YO
         Zjedra1GzdNF3VUrDraHjaKMslHI2XZBo08ppmQPs6yyUiy/GdCLn5S6CXfyFIxHl73K
         +cBbVCgNw/pLezboEZhrl311QGIIMHzCNcWFSZP9lwdnaMQXX8T5LE9KhhGVr+NgwC/o
         ahIdkFx3WlF4TRrZbZAnh3fvUId+KUi0P9iNsEnVGXKRiyaSbnh8o+wpOvopNS9IRVaY
         dqQw==
X-Gm-Message-State: AOJu0YzbjM1ykPy4XBCLz1wPr/mCS1VQEuZby1fzJAPmQMQl5tIAhZPh
	J4TFjGmUFUo0scItPY8zK/nbfaLFx+eMwR2cECpgv3tK3ArgW3ztitFa3AFAXu8oEgqxfGTbDh6
	xWSy0qUoWdTUhNcYfN7aibr48gnQUyQQwIwlYuO3J/sE2rwc4s5MQXycAkgkgg+7tk8C7
X-Gm-Gg: ATEYQzxJsSBbIT/1O80Lulx5c+tXN6XnBZk/IuDsdTH5pForahy7iOZDi+DLg5dD9Eq
	ZCOOv0oXJewSoaRXwToVRICY+boL+W9pKew7DDnIyILc2FG0fhXP5obds6i3cffgvLVBG/98Iav
	8eYLYK0letIy1Bw+PqzwOXLxJBUhaDJzVxQX3VRt1oQw7WQnbBU2t9ep7QrBWuODhYl8KVnPZ47
	GC2Ac7tgqE8JtEiyBdBq2NTeUEqR23kuxRjV8/sYj1TEJs2mbv1ts9LA7RXLckdk72EAlr2OguM
	kXuqXuYgHEaAPup1oPyDW26cChqxKyQDGL9YjtDGxWSUCLWdVgq5Url54s+baIIZRghQgcMTIBh
	lO+37PHSA/Zb81nbXUWwlyNrGaSLyXLBr+hpIzLLDTdnfpF7DjERyO1aqZvJayoxkf0YcphwajW
	gfLvw=
X-Received: by 2002:a05:620a:4629:b0:8cd:76fa:1bf5 with SMTP id af79cd13be357-8cdb5b97c2fmr280629885a.8.1773397710431;
        Fri, 13 Mar 2026 03:28:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4629:b0:8cd:76fa:1bf5 with SMTP id af79cd13be357-8cdb5b97c2fmr280627685a.8.1773397710071;
        Fri, 13 Mar 2026 03:28:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0c745asm35589566b.67.2026.03.13.03.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:28:29 -0700 (PDT)
Message-ID: <52bd0410-5009-45c8-bfdc-b493e2f60610@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:28:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/27] soc: qcom: ubwc: drop macrotile_mode from the
 database
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-24-b7e8f800176a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-24-b7e8f800176a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uKLP8CVf5zVfgqzuGPz69f6Bfdbs-tmM
X-Proofpoint-GUID: uKLP8CVf5zVfgqzuGPz69f6Bfdbs-tmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX7SiuBsqAQJ+Y
 A+EQ171lDmmBgXw/PWms3vnH/SCoEfQtFWrneLMEs7Wkcj6GeDvIs/z82ISBM1fFWL/wP2dE1Qx
 tlovRwnP3t4okHEXsx/s/P8gTNG50nGpgq71+wtIdvYIdRvdUIQSk31mM65pOtwZ/YIOIRhl9rf
 6kn9Aic+NtN9mNQuEl4MNm552lruxeEeeHNVcKPVY0lAXM/uQhvvZguEW+riDoQfXaT8/pEbzVV
 zVTJPqAAcVVadvldqLduX1ebWLxY7ZCCTfSvp3YG+7ULT6cbAIqQ/eHbnBvEci3nDTQOri0VKSz
 mXhX+7uptcybrsBDMXJfyHA61WS/b/9EjRsU5R7lPe/tN6uqLlq/+qbbbhdgMMawGGxef0VsQSM
 5+3s2ZZ2rkLIpQ+9agu0FVkhCF8bfXUC4kcSlSCnGMg2tDz5L3h6WP0f93J2JhFOJQ0x6wnQjIR
 J+AS6WtzMoeEV2HKLKw==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3e6cf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I54dV6YZZfg9ki0ab94A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97409-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 5E3BC281700
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> All the users have been migrated to using qcom_ubwc_macrotile_mode()
> instead of reading the raw value from the config structure. Drop the
> field from struct qcom_ubwc_cfg_data and replace it with the calculated
> value. Split single UBWC_3_0 into UBWC_3_0 (no macrotile mode) and
> UBWC_3_1 (with macrotile mode).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

>  static const struct qcom_ubwc_cfg_data sar2130p_data = {
> -	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */

Is it referring to the values reported by MDSS (4.0.2 enc, 4.3.1
dec)? FWIW the other doc only mentions UBWC3 for the platform..

Konrad

