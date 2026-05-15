Return-Path: <linux-arm-msm+bounces-107896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKbgJ/EQB2rgrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:26:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 143C054F843
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B24693043399
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB11247D94F;
	Fri, 15 May 2026 12:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3e5JxII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eaypbQj3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FA547884D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847144; cv=none; b=jjx+pmXoHZpT1omB7ACQeX2SFHIzjVWon1m4uOnjkVXg3/DAYKAIMtySV6kXYsO+AktWrXCxD4davL7PPZ839xJwWEuMGOEmDXfPJlS7IpNK608KMFSNKwKHY9EelV/mVSX0hWNgV4xKh7s8NSGc6ftdawObuhNRumpjSWb0Sjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847144; c=relaxed/simple;
	bh=Ka3qm8iBE8n8zjZnG+YFbup1oVW5hThp/IzT8vNc3vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVkUs/Fhga9EjYD4QHkjWDa98xgo2OticdEgAsG+P4++P7oKUmR+FaAr/r4SbaDcNkNbXmDaBCrC8sH3ybupWpGR3abQmQtxkxODWVYcyzxzHN292eNmn9ykubtRGLX6jJwHRLxgWqQwfLTz06rtmBTX43rMwaZDPbRsg7rLiKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3e5JxII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eaypbQj3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBChwl3197965
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=; b=B3e5JxII3qlc+mbV
	iDmDtSmXezgny0Jg3dyc74B6ICWqVk0iyyOTha7tl+tWOj2dvZLFlVPXcrxl/E5y
	N+UlCwhmOqJOJMtu9238g8MTuPA7KjW+Kr154C6rTJdFQK2g5zxonNXH14d+eGVy
	LBimhj9sZkfm9NXndRTQTDgO+/MNMRldPXfkhNmQiBlL29lDK+DFEYzIalspp/41
	0P0H2T/A3i/6vnyt+pYDApQV0xXbJyKaBnZBH5QGeF+IHOXGynuZe8RhXFhKethg
	l+PX7jn2nZpeUEech5ow8rx8b4uelrbUeGebGe2ONr+l71wtrpraSAAMQjygcnN0
	AnMyRQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qb5uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:12:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57606a825easo88871e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847141; x=1779451941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=;
        b=eaypbQj3nFCQNOl9bY+gXDCyu1Lb+ZF9dpsGEYAug9g6MUvOEXMHddVN84ejgWikHX
         XHTQ9U9/gRm1AGBef3pMZe5qKAIXvl203bVwcGvWH4vC0NBBsxzfq9nB7x43XyXFj9Dp
         Gs633Qj//HHKwJ6ftYLBL6QFp4rjBDAs6pD6OcHQelHToSqODAvZXa/tE9lmGG1bSKQ2
         WTViyiCpOg4hVxJC3Qcr6emKAFiSz5DBCmUc9nuc2YENMJsNkeWQXn6rPVt+gK1aWqxw
         ltcsIciQfGGoWu3XaFBTsbx1Ja4R0nlkc9ehSo0QZJi4eHQzZnmp4Uj3yyGLsBawaojF
         kuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847141; x=1779451941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=;
        b=oSS3bzH7hInVURI1+Di0As7w39lil402q9Z8QedWDSOCy3kd1h4J4w2Hzxv/FCPyaX
         /Sc37SPRfBkHnkYjhGc2z5S+HAx5i1u1AdJK0tDfr8hBaKyeyI2wy5DTC8fm+/5rRbj5
         WD2/4iZGf5BlJc4jcl+mhoSAHCGq9qwtnLjJExgcXdQ3GGJPwtMqrU4cfJz00yHrW7iU
         VFjUnnOUGF+hSu9LJZkykIEVJQfIMDnJbio7BVWG+NkbB7B15KaLfOpM+LEgys+OwrFj
         8rhaQ0vNyKSCWWrkZDcArsPlX64zqpes0acWjVzhXFZ0Z4KstQAz9uiEM5qL+unFdtOC
         wuzw==
X-Gm-Message-State: AOJu0YxlUL1VBP/aW1+67rDlFkH3TA0oCGLHW0dIK26mK4VDHE08vucJ
	Dz2/7IaBo+nA+2jD77qU/G55dR/iT0lnr7EG8KEICsrpqnSZMc5Ao6n/o/CxCZldJiQVC7r2HQL
	kcREO5tm1MPCf0ibv1WmtRGePVn4Cc8f/t9ni+9s7RpXNyzAkHPnh+p9ykAmqu0xCoOdw
X-Gm-Gg: Acq92OELD25rRBIn/SPkjbcdH5AeZcdOfWFh20R3undlU11swKZFCh/FCAEKgeaZjP6
	Ju6OVL1yZicTa9dC39TB9vOAouqzMR+kpGFt/+ywD+2SkMNVTEQFekzXMtjHNGwkezxyMjEOKFF
	inLbupkz3MfIDQeKVHD85zlgNrpQGRn2fA2OlAxSP2K3QeKyERb4bpArEwZ2xftXl34ycGokPfd
	6mcK/lb74YEm3skk/xYEcrjAAKCGNgdj7ggF4CPrzwfNbscPrbNNlb4WGrDY13pn8iKy2KEgnoM
	rQEkL9t/+4WdTbSDTt4z8c7M5dxEm/lGvw+msTbCSdQugpMy3YdXDOQYytWGPFKhyhvXPKvELpC
	8hcBxLYqaQ8jAjFXlzorfHaCLKbdqZz0/Flqd+JrnZcj9r7Bb7+KIYnB0ZkEX4Z9EFOBojY0fUb
	pFcl8=
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr582276e0c.0.1778847141534;
        Fri, 15 May 2026 05:12:21 -0700 (PDT)
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr582252e0c.0.1778847141135;
        Fri, 15 May 2026 05:12:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c631e2sm214670766b.28.2026.05.15.05.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:12:20 -0700 (PDT)
Message-ID: <34f80a3a-1b8c-4c2e-8773-c0169518df60@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:12:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for
 video GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Cx9fISta8-huQ6uW2GJ_FZFUn8latycA
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a070da6 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX7vImqwz2+Bmn
 NAtAihKY22h4k2O4v3HOrjtx21HfwA7Ozjp+8bcVRkqwdXHGpz7jtmpEvpC0Qf6zSXYBXmScULm
 2rLOHT98B5al5bsHYT/KozDk9BlfEDh2e60x1WyYN9cBIpKSMNE6n0gJW61iAyNCzORGYkDF7iE
 oXaUwpNGuVmiQhkeNGDQnMTnwDdVwqeXOcyHTmw0mutDLGR8LtB3hGTutJ5pL/cGUrBbN+DRwjJ
 rBZsEkDu2uu7SCaalpocQx9ZLoQr19ouFjmL3TUN9yAerDZezw4kVjbdWiNjKTGKWQi0vWAj0Sn
 O9wqLtultaKxRlqN2LGk82ShPMgglHXkm7dPSj8hSVlA8/iOgeq884xLeLxm4UKO6uxGpXxVLN/
 Tf9wPKM49DfPRtcuRYCaGPgD8TSGJEMVI7pTJAQM37u6taUnF6n6PRSNUBD7lEqR2ET6SMMdei+
 4dXZHiXeesIVgNnmmWw==
X-Proofpoint-ORIG-GUID: Cx9fISta8-huQ6uW2GJ_FZFUn8latycA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123
X-Rspamd-Queue-Id: 143C054F843
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-107896-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

