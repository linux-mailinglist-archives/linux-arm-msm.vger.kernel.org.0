Return-Path: <linux-arm-msm+bounces-93427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAlRL3U5l2l2vwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 17:25:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF30160A6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 17:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B26F3008099
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91E3226D18;
	Thu, 19 Feb 2026 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHGwMGDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPRC3uq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC934C990
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 16:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518309; cv=none; b=IHovbrdIG4Wxp4IzrJEX3XNbMNBhxl2zWimxVU92KAi3HIrAk82ed1dhrslQh4YikfHkLi/A7FYGqGjhMj+XJsyuJ/jQyDuyxRm5jsfPG9NevBGXqdLyehoKTh6z7GdyHlv9348mw6gqlfU4I0/x3pAnR2c3qKYLRJatev122qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518309; c=relaxed/simple;
	bh=7EPnSgIjJtONu73iCmeC2kZCGyJVvmH0IQj5AAsrsqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cf0nBbf4fVsivHHhIMAOJa0lQeHgv1zDNvyuL4Vt51nsZ4qccDrK4SBCyD2qwWRaYIl7vRDLfhq1hADPQn7KKFromJyN0W1tBiBH4YsHeEXwLUi1mGp0O5pgav5iUvGPBg7wX5LFshWZ0kg2Am1dEHCURKsWomNIdtPW9nD+7IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHGwMGDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPRC3uq7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCxH1n159909
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 16:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0TSlaouB0APM6wseQe0F6DwwPYAdSpgUfOura+QpXY=; b=SHGwMGDAOarzzNvm
	YsYG9qUxImAGgg4SFwbfuMwG3M/YfKxSY9xKBd7/b39Z4ZLaINxOQ4YU2FgIjhRg
	RaScX9sjXPaX37yBr1qMQHoZQrpeMxQXxr5icJKR0ib3CAOyfeUCX2G/M00zQLdg
	Ku8XGCn+tGyaRFwOE2DCd1KozAAL4/1JmQXZDjo5ygIlcije5dwSOS6K8R7/oVTH
	m7eSYgqVJb1+Khm6p3hu2xFuceDqL9TeKjW6T3uElXU6spnHaMGT8nNFa0F3ATEG
	nuMpXoCtbLCXtgqchJLPdWKZe/kbLNBfrEveWuNKkjZwfKi4Iun8bG5ET4skEnWw
	4v/QYQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrpga4pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 16:25:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-895375da74bso9489486d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 08:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771518307; x=1772123107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0TSlaouB0APM6wseQe0F6DwwPYAdSpgUfOura+QpXY=;
        b=aPRC3uq7O+xvit7R3nmrR5DQuCkCWSU5H1BDY+THkRJPmOJwBBrOqnZUldXmZqKe5V
         PHU+AdV+eo6nsuZZ201D2dy2bqjVGSLNLzfImM/jSNa0M6TLqJAxe9YQHgpKtjNwcJP7
         1mxkLrp0sNoO4iU6U1c7cAexfmZ5ZimtO65Bfk0+eL7GTe9SjXhpdP7NgmHtCwnOS5kv
         EyWFuB40PUCwNXyov2GNcXoZp2QeSjfisyuq6YwkLyurWhRCf/0e5KS6CjfsZb10ThlF
         SR6+0nYCJG/I8WoNT2yGyZ//VILfjMvxJSt9uIe6U+W4OMJ2w3ICsXUqTnVgVyyS0QXj
         53SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518307; x=1772123107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0TSlaouB0APM6wseQe0F6DwwPYAdSpgUfOura+QpXY=;
        b=msUCewts0kxQ/amTR5+RV/UQj540AmkPmQD56xQscgjFvWCtjv015fFOtcMpN5vu8C
         pXZjc6VVrGKSI8MYOyhJ1PL9v/bsHypyBV/qEsKZiqQR2yB+oc5+cAWh9lee4XlewCom
         /IB/ZS47kRDSg30m+fP2Kg706U5Tz96/mOshRQUuWO7f+rND1Sy6XJbYXkhRDvahgqNJ
         EwtHGSF/hPpZ+NVCdg+nd8K6MUb4IFH5U8tAMez7yDkL0fb16ZS2quPnTSp+7a/oK4tT
         EMA+mFRKn4vM13WEWeraC/AwX1k4M93RukORPgXfcGE10ihBNhQn4/Sct6Dj42QVlOa+
         KU6A==
X-Forwarded-Encrypted: i=1; AJvYcCVHF3whKMwX7DQmXgmwD5XolhbsRD1ieyJ/pKd8Ac143JlIQj1+mTQt/Kztoi8wM0bo68kbUOc4LTawzzSc@vger.kernel.org
X-Gm-Message-State: AOJu0YwcoxeV7vgedDIYKotJPY0T223OYuTkMBi5GsfTE93/q4JdsdTj
	4HRDo0QGu3XHNpgG+zUp55vYptqXhhXsUKCtVcCpZJ6YJE4ANeRICB03qOFt25tj+oU5IXocPfR
	Qa0WJVXAqm809TT9yJukccJcGmfrH4bPHyu9ff/uq7eZwjs+7l1e9L037gjeYhTucyxZD
X-Gm-Gg: AZuq6aLh0QxJ15S4Vn8tjNJeudJBzB1FK1k2PORdUniomytjVti726SAYX9GxIojunc
	mpT9MUndl+xRbVi8/2iErY1h45F440QGbNgFqDyPlOrvfwvWXmeGGLphbOYch9qGfJQ5u6KxELl
	Knu6iNW6amnnTbJBdS/IvQzTAm16ylvGxAWmbt8hrigTa70lmgnHK6+BwrA2QKr53t++OugvEfZ
	lVQwXix0N3dV+zSrgICHYuteu3+va31MLInqUQuuzCZ9ZNCtpm9/J4bOsXwKEarA2cQ4iDUc46w
	rUrjsMFJWEvQMrQ5YOh1WnJKHaevn2WZTj6gMOptHM830JB4wx+Dgoa2zabZSGKCe6UowSahTUQ
	lxXwjgxXz+JLkiQBGsByVYgVcQTotgetK+ReoT2NqxpmMBKTpcotyP98nevMIliBCucOM/mtW4e
	1Y13M=
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1985067785a.7.1771518306879;
        Thu, 19 Feb 2026 08:25:06 -0800 (PST)
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1985061985a.7.1771518306135;
        Thu, 19 Feb 2026 08:25:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e356asm4013389a12.16.2026.02.19.08.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 08:25:05 -0800 (PST)
Message-ID: <63dfd40f-9b13-44a4-9f68-cd281b1e0d2c@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 17:25:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document the
 Eliza QMP UFS PHY
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260219-eliza-bindings-phy-ufs-v1-1-1635e7b53049@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260219-eliza-bindings-phy-ufs-v1-1-1635e7b53049@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LfT_SBkycjCayNXTRMWIESi4sdADPCzK
X-Authority-Analysis: v=2.4 cv=JrL8bc4C c=1 sm=1 tr=0 ts=69973963 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=M5GYClEuJsCSwWFCvNsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0OCBTYWx0ZWRfX+jg4lN4fuGA1
 NjHPXc9pGAW4ejxtOfzXQKSlvK5bgniezL/lbMkxFV8DLTT6/eYr8JikU30+yt54/0Vw9NH8mQQ
 UvSM/Z0OltLSyT/9xhQRD8AyOOuheDNoqEKVd2NSmn5OjhZ8uSJ4Ak98PzharAQ1V4nxy8ZnVFg
 ho5qFSFkeKULcd1fUJCUBW1Dhkf8Syo2PIcsvLHZqHbNTe5W8m/uXfKYpY+9l5pHyXMwCQIqKTL
 5w8F2BmvvDwPL/8c5UD/QmxGcb16bUlbAaSWxUdDdQYJaDFI6+I12NrTHcb+LaNAZCdiqiGx3JG
 IpPxF11AWQYwPKf5RftcoObnKwT9iB0+rSozBEMHu6NHmRV69PoqcUNBFHfdgsALlXMMpZ4CdOI
 dxKYa1R+LyyXX9huLS1ymNavZuybgADTcMKJor6i6h9R899zHAfMT/Lo9T8zW+OtZNXZ7eyht1A
 /eoegVDA+S1OD6XDbDA==
X-Proofpoint-ORIG-GUID: LfT_SBkycjCayNXTRMWIESi4sdADPCzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93427-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FF30160A6A
X-Rspamd-Action: no action

On 2/19/26 5:17 PM, Abel Vesa wrote:
> Document the QMP UFS PHY compatible for the Eliza Platform. It is fully
> compatible with the PHY implemented in SM8650, so use the SM8650
> compatible as fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

