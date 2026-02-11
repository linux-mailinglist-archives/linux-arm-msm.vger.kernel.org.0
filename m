Return-Path: <linux-arm-msm+bounces-92555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yICYI/Lki2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:09:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C6C120B2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A29413018F3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115B92F5313;
	Wed, 11 Feb 2026 02:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/SNLN5A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVCvYuRc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A8C1A9F90
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775790; cv=none; b=bsrkg4NdVI01rQC68ZUyrRPYHFvIgtV3th6x0O8UFUJ58tlaZln8imlG0LA5mjJwGe8B7dhn0eClLgqArvXHVBhfXoHBw8Em3by53dyX3dNEYnBqyIREPsMjSz/mByyC3yr1q9aHIJBvF0OJ4S5Vun1PN0OoWLxvdmURXfhnD1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775790; c=relaxed/simple;
	bh=CL0jSb/x5mupyFP/xbn/3QT4Whuy6K1BOiO2UvAbZbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WklqYXGwerWsd8TO6bakvH60xuuEwgd/zCmE5c53xWc+hANJE+9EyzOtyBrG1pGp4WscqGSmlQmbpPA2/ikhcApqC1Mb8rF9mblSv73NGXpoRXiIky6w5A0XH5hhlsYV4W9ad8mQ8p69a/ONUrOdLgk94uZjh6RX2lleesVs3tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/SNLN5A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVCvYuRc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ANo2II3320514
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FvEi9aj8WNc4PE/SSBlGvqhE
	isBuRuKk7oHbw7T8/2Y=; b=T/SNLN5AujDX8zuy7RoL6MDp+9dxEds6bj9zRi9S
	BUsRpXrHNVzSqj4glbqYyM1QwZbo35MAwR35pjXVFzXp80IOvVyHDtMHQDF10+py
	K+qqq0MnldnxrCuaJQdPNWb0xJbO0K4HFRAm/U+EpHEVQwQT/PBThZXHDPxWpig7
	Uz6P7mBFsO4J0tlkdbwwhHobv+Bth/1anwIJ01pUl72YfIgOQeKnR9uB6+MRfF8n
	c9O6asvSxymGtxY7GjenuFoYVdSNhD2BTQ+/Fn0kmkLwvPH9KOzU0xKuLmOqE2Ou
	Qa4t3KIFICK7Il2jsbbPUr5RiFWYEiSWkErAX1a2D/H2eQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8epsgarp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:09:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52d3be24cso225293985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770775786; x=1771380586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvEi9aj8WNc4PE/SSBlGvqhEisBuRuKk7oHbw7T8/2Y=;
        b=JVCvYuRcawtgC8X/hXcoj8xnnyPedeSb85pwHBoGrc6AiHFeKfpPGUo4Q6r9rQpOjy
         5V14z1V3ehokorUiKfyVT3PVtAVRP4PFJSHCnIIcYd1diNWLS6E/YPJlq7/etCZDGg6z
         A832weazMPUhFBQKEgcTAAQIz0wV2m6M1y3BE5tgVVhXtqLqRBu4q8wka3/6bg/ybTZm
         qOWaeXojP7GTn81tQlkZx1RjsfKybGk2TLdUXbd64CaQrNd/zMxBdksApQHq2mJRSU9B
         Adbwm+9wCZ4ViTssEYyOYMGON1BHl08ZC3Gtf2jUExXsHBZGWAO+gcdBUyNyNYO+ZMfI
         iZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775786; x=1771380586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvEi9aj8WNc4PE/SSBlGvqhEisBuRuKk7oHbw7T8/2Y=;
        b=RszcWC9ulXjMn64HZqKUbCkcSaNmRqyNxe01GYz82xd4AyL46f+0edo9eAQh/mA3XM
         HrDedtYmR+c+l0xTzrCKBjFQYarNZGuYmdeFBIFvGxpPJVAAVgnNUfDT8+74d8bJB87J
         E6Ay1OtLzWJAClCf+Wd1VgIlN0y0xRdtUSB1N9qdeFZzlNuQkVoUJOwN+edR7n0rhzSG
         9nssn0ZKAzd+zxluPp2BqpmC914IK3NJB37kITFOkG+Dv7EVHu6msqz2vXR6Id3K29OM
         FmbirBuc1cz3Xm1UbOy0toycdeHZ5fyNOYDe72Xh2wOmCGSaNqODkfGOSRKy/fSJzhe5
         5IkA==
X-Forwarded-Encrypted: i=1; AJvYcCWIKe/IWCWbzBVhdRSvP77RtoctFevzdBeR9vnThGhNYhfk02Gmx17aHHaL68Ww0/wl2+tYPTP6411IpzWp@vger.kernel.org
X-Gm-Message-State: AOJu0YwUXlSrm2fBuNOcHQdksvwJlB2BOuacELjnzAzireWfxWlP18WB
	m8oDgztDRBi09QI0ypF/Y7u4UKegjSjU2yGilQSQQK3fnFlGXc6VkB+LYqJzICACs/XOjuELrom
	J/IjcnQrylGTr6fjSm8I09pQpzs8SXglrtJoQWF55d3ADHm9571hl7sQ054tHLaGoQ3oL
X-Gm-Gg: AZuq6aJ8VxGrKOkyfwGdUJ+UBlmi4V3hx7D6r+SIrJNSsls+Nu2AEj+KXePn0T3gAKm
	OVmzUw4mBx6vlYP84PinU7Iw3dUNCIILwkHV3zGIEWdGGaXIGaPbZDDes/cBUAywwx4eahepVCZ
	ajXz3+0LUaeJ1n2zI5vKoBkMkCIaqO1OMavdr5sWCFy6rxA2viCZ/Y1F3yGLFLXI1KVENwOw1tJ
	KIDkRWq/unPCSx+oZIKktBIhjnvfqPrWWybHcJbWuMUWWSaSAwH6W8o5vt8VtrQU6N/4oT2A4Df
	zOpKtCH/pY+BW7SyoEbTqvkbM7tJmSLXHyo11gTmmtFYAAPcJI9KWMVzpKocD1L0/xb+0/EU0s7
	Sy3tMHMJHHICpkaJfxKSVaJOpuEtP8RamgY/BpglGVdWJa4Ac7rD7AreZN/ssxqWtWs1QsjcBad
	GYl6F9okS+PeKUt7lshPfrVFnBVZvIWFcIAZI=
X-Received: by 2002:a05:620a:46a7:b0:8b2:6606:edaf with SMTP id af79cd13be357-8caef5f3f53mr2380199785a.37.1770775786565;
        Tue, 10 Feb 2026 18:09:46 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:8b2:6606:edaf with SMTP id af79cd13be357-8caef5f3f53mr2380196685a.37.1770775786106;
        Tue, 10 Feb 2026 18:09:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5976sm619931fa.27.2026.02.10.18.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:09:45 -0800 (PST)
Date: Wed, 11 Feb 2026 04:09:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] thermal: qcom-spmi-adc-tm5: Correct the voltage-code
 scaling for HC
Message-ID: <ta5hqi4jqmxinm2ykkdsoc7poq7ko4jv3qjuhibzm3grqk5ael@uawjompenmjk>
References: <20260210021819.12673-1-mailingradian@gmail.com>
 <20260210021819.12673-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210021819.12673-3-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAxNiBTYWx0ZWRfX/6aGQUdLb0JW
 UcKJmOl1pzp1jS5BMJIJS5UArXLpKHYVENrAS2ZrOkNaDfkmdTPUq+AdwNqJbvGHk+CTKSyioSI
 tqiyWENlCIEH6sI7ltdJulsrIV8cnJLftFHpSw4eQF3Bt429GU1xTC6Gul2W2kd6TgUPiOkm+pB
 CQuPjOac7z1kuxXa8qJinhejj6CFlHJ7yTPiJZSCEfd2s12lDHvkXtAZHdtu5qwMkSmM6u7tTLN
 4PhX5PUUO2tDyx/24InzN2bIVP6YxYScq3Fpjm/PuflJgsgvacw5NS1DIcYGYQ0wvxtV0H7LCFe
 uzGz3Y2Ip7LbeNIxtxymgIKl9tb6NrjJl1UVuBkT/MqL+mOxoQlxgiAuApT/SgFkqotXQPwiRL9
 KQGbxwDV6+29dXY8rZCdknK1aGYX/ZBR3nH4jZew5VYc6oYpSMCJ5YzLUWieUXikUxvAQZZWM1f
 z2kd5jDM0f93XUAPMCg==
X-Proofpoint-ORIG-GUID: 9QLLNlkWI5gfTqyW2IyWRAMaIGUtiM8x
X-Proofpoint-GUID: 9QLLNlkWI5gfTqyW2IyWRAMaIGUtiM8x
X-Authority-Analysis: v=2.4 cv=I/Vohdgg c=1 sm=1 tr=0 ts=698be4eb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=IiwsIYU8Yi2Zta6pR6oA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110016
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92555-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 37C6C120B2A
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:18:18PM -0500, Richard Acayan wrote:
> When support was added for the HC variant, the full_scale_code_volt
> value was copied from the tm5 variant. From the downstream kernel, the
> scaling value is 0x70e4 on PMI632 (tm5 variant), but it is 0x4000 on
> PM660 and PM8998 (HC variant). Correct the ADC code to voltage
> scaling factor for the HC variant.
> 
> Fixes: f6c83676c6097 ("thermal/drivers/qcom/spmi-adc-tm5: Add support for HC variant")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
-- 
With best wishes
Dmitry

