Return-Path: <linux-arm-msm+bounces-94084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBRQCcHXnmkTXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:06:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 801BE1963E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A154330D63BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389DE393DCF;
	Wed, 25 Feb 2026 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gj71Lqmt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZTblnAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C9E3939BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017374; cv=none; b=QPM0EF4kkKb15q++LgnniPMABOeEWUpyICUerpk7M3HOtHmwLKg7RY7VIzWBh0MVCoxwT9pBadxNED9JYag005xJzfKiqxingH7HzdyIw4blNDmmg6IFK3FJigeEhe5+jFEcq/b/jaOIaCqDCViMvfRlmkMWV/k+VPt29dckrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017374; c=relaxed/simple;
	bh=lnvdGQuYIYU/ilpY/EUNjqA6cJvRcAVJR3APF1T2dRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htL9eQjtxWYQHaYRi0YKbKRWljkjkXRxYCgVlDYkUelmlMPZ//5q3OI4ndXU0ol8uXQg+x0pZmso3N1eDjYh3v63eUKpo97K7GPSMJLJkBlLpbNc541+kIhR48Zgp9+xav3hmGUu4yphU60cOvafDpwWsHWgOIwf8wsfCYRZflc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gj71Lqmt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZTblnAb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9Stf62692129
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TCehKZ3CTAFQvrgMAIAtSRO7mBHF3+IpN0ZUYoyGgrc=; b=gj71Lqmt+QsOGcgr
	QT+C7TeAdLB/L1JHGqTi8D/KxWELRfsdmDJmi3LQ4jfk7jgJXAfoR3jMEiCh/A4p
	IuSEij9RaDPh5u+qPfjaRs11yqB0UUJTpgFu1jbCheoIicN87s2qN+RDVqDjRBTM
	W5B3X6WTUhNqG9MV4UzwVpH8gY+JaG79UGHkHcXtQ//rcdCTpbor1KCxTjG/P5+V
	IMnJwfSUCHYOgKKtQ7dzF0ADhUb4RDSKNgk4OJzmw43W5VsGM6t9v+hg7J0ifRB/
	a+aYiKW416s9Fqaz5ODWjtPmhEOfVUF3bnS6KKHLaDF0dd+/GsETlalDakED6/07
	BVcTfw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg2gtymf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:02:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896f5c90f07so70361776d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 03:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772017371; x=1772622171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TCehKZ3CTAFQvrgMAIAtSRO7mBHF3+IpN0ZUYoyGgrc=;
        b=XZTblnAbD6Aei6NcOYHcymsqtCe6vcF/sfgKIr/bPdSJpk40jUNQurQFBrFYUlksWD
         3isKJiAI8SdVg1GDgZUugNxFNKflwsal6zQCEwNdh0jgc8Pe7P+CmTLddq5WW+xmDJRx
         SGBOdTnisS7i8MGlEMb0CI4cob8VY/dl0dY+j4LWpu0QIlOBQVsLTcgV9BtRpP9qAkOL
         pbub1Bp8oX5pzCREixYZ3A3VxRdwV1M8x5q/aunb3KP9qtjMKLoznDbFcTGOEhkgjf04
         xew8LuJMflaQd8MRv1pHhI2tcJs8FKxVOfDGuO2v92cOOPprRrvaBmt2RKFn843yG5gl
         +gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017371; x=1772622171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCehKZ3CTAFQvrgMAIAtSRO7mBHF3+IpN0ZUYoyGgrc=;
        b=jQXjGIPJlqZuaaJ0ibsx/j5kFlvALo3NXjtF9vDOl68q+JYuoaeeDdvyeexrSZZnYT
         X5LWJq2t+bq5uNHA5/HhbFDQRIVigfrRNd6Rpz+TSsdmlwx1aKcIzCaMJGr1srqJ/54+
         jgTbLBfxND69t+GeXfp5jW9qapZvftCxkkqDkm/5NVlqf48q45NeNlalUz8+teTjRX+Z
         rsJrsbwH2vPOx++f7tKrd0SyAqO8rRpoQLYABUOvvzmS6WNChSWWM0JZvYqgpxK5hzVA
         uMv623qC6/RywWQ3ZbpO0SN6GSYCdsC0n2Np821mw0bvk3aex55QhIic8DmxtDNIAMrQ
         /v7w==
X-Forwarded-Encrypted: i=1; AJvYcCWGXZgkNKGLakr1xYsx2BopBYsPyolN1KBEd+5MGivYv4C3h+UHGqIOtp3ehOpvmXKiTEr+9R0HSGLK2cRQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Ml3Kzqe57DJRjTKp8fLsd7WP7OPbqxIOmCVyWelQZZj72iQb
	aXRXDRYBnhLlANS2o2UvVnMhAJE6ugsKIQBOy1MLi5V151dSAvPLPHkRPHeiaeq3r2w32e7T8a8
	gSpzhkTneC/wXG0IICmNi/I6/HkFd2yW+yfsCGqMQRERGx360VE5oTne0iOPW0JhNCPY0
X-Gm-Gg: ATEYQzyCRotG7kCsy0+TCqpr2RPWilcpPxk2yR/NkliVx0vkORSME8txgbJmXxeFTAx
	mRZi3Q7UkKq75c6tesEEe8reNhCSK5ySc8h2ivEOtBegWyYPg1mntar6Dj0BHf3CbHV54CPtNcY
	PUvDX5j3vM3Utw4o8ExHZ5kV2Cmuq804xPX0eaP0CkAEZo3xZApoWhSKGHS/KlE/1527d8hIHnh
	frWdInaQk8E74ar9F8R5f0bFZZPs0BLqGyfNNjac48JGkGBTseI/DxN6fKKkaGbtyFRp/fu7VVy
	rsRf7NgvMZHFTxO10S4Fnad4qxv/skrBUQW8g1NpS0y1mu0e0Vk4VRvHE7Ot39/3nG7HFZei/HK
	VZk2CvdQB4eQ4L1fYpLY6sss1lbe7+7+lRBgvw2pNl6AoOjGMnoqCDQ3cLdO4Un8PhjnJVTC1vs
	RT/+Y=
X-Received: by 2002:ad4:4ba5:0:b0:899:af95:397c with SMTP id 6a1803df08f44-899af95776bmr29743296d6.8.1772017370964;
        Wed, 25 Feb 2026 03:02:50 -0800 (PST)
X-Received: by 2002:ad4:4ba5:0:b0:899:af95:397c with SMTP id 6a1803df08f44-899af95776bmr29742886d6.8.1772017370450;
        Wed, 25 Feb 2026 03:02:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c824e0sm511254766b.22.2026.02.25.03.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 03:02:49 -0800 (PST)
Message-ID: <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:02:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
To: Krzysztof Kozlowski <krzk@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-2-mitltlatltl@gmail.com>
 <20260225-analytic-economic-parrot-4c3a45@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-analytic-economic-parrot-4c3a45@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tx77AkatABLi5ncQkWnk9pBtejL7V_cZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwNyBTYWx0ZWRfX46CfZKccLEO5
 ixd3VJjunkmK8cMtX33H6GiPJcdxxVwJnOqY1U0Ax/uSeP0OCy7fFwlo8iIUElMhI9pzr8c4il4
 NTDRDpIhbik9Lk76sbhv8RkpDSxff5AUG7GjZFrxIvMWTg0xmpcxR3aKfe8r05/Nvse6aAGpZEI
 0ezprnlJyuFr9bTJrxI4TeX+siCxLAQxHphczCI4XtDOFhhd6CA5RitFW37h7A4ROB15aO9hTcl
 3LySW77qrsVIb3DfmEI+pSoNZs/Gq2tEU/dOYRbD7gLf9abSBKGRjDwfboZNk4hFJkK7PF5BgAA
 8XSNq6ZHb4N0PxcKIYCTIhvS975avH+ZT/hpZytQNxt6FJa0m4bsQgBRHCTviC44s+r5zmiMJgv
 9FnUbhsTo3WoMgcG8GrCn1jklylqBX1X0VbiNA7NKPz8sxZk9ixarXFZDXREpFAHjY2pPK9fPjU
 wwVbeTFveRcJ4ZbQIkQ==
X-Authority-Analysis: v=2.4 cv=ftHRpV4f c=1 sm=1 tr=0 ts=699ed6db cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=iltczeOmeScF9XLDky8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: tx77AkatABLi5ncQkWnk9pBtejL7V_cZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94084-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 801BE1963E9
X-Rspamd-Action: no action

On 2/25/26 11:24 AM, Krzysztof Kozlowski wrote:
> On Wed, Feb 25, 2026 at 01:45:21PM +0800, Pengyu Luo wrote:
>> Document DSI PHY on SC8280XP Platform.
>>
>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> index 9a9a6c4ab..9223af1f4 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> @@ -23,6 +23,7 @@ properties:
>>                - qcom,sa8775p-dsi-phy-5nm
>>                - qcom,sar2130p-dsi-phy-5nm
>>                - qcom,sc7280-dsi-phy-7nm
>> +              - qcom,sc8280xp-dsi-phy-5nm
> 
> Your other commit claims it is compatible with sa8775p, just like some
> other devices here.

If that helps, they do have the same values for the REVISION_ID registers

Konrad

