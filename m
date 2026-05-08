Return-Path: <linux-arm-msm+bounces-106606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGKLFEWj/Wl0ggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:48:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6124F3E03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37A97301A732
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 08:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9DB225417;
	Fri,  8 May 2026 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XabZ4duL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4JhIli0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76772F8EA3
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778230080; cv=none; b=j9MwK8ppG6UiC59B58d2U38P5goNFrWGFOnwbHtUO0MYy6HtVhwemRRoEqpQuzMrTgA+Ods/kWF3tq10XDmSRKOjKZconLgjRLcVgF/1rSJ2Nbc1bfLPMNSAf58Gc8NkUjn+YHQTmGiDqYy7BdkA9k0O5FoPNLlh/WaXc5mJ4KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778230080; c=relaxed/simple;
	bh=Pyw20vUTLDkdwfwf+/4R/pq/83GquxoH5fBoAfkz0bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUg3FDsolZeGaJ3dghNC1q7ac2g7LA79absLrbjPQdUuoGDHo0P0nZePgYHo2TtD4zqF0PiqC7UfvxAgXysidkQ4tXXkIDPX8qhcx/FWRZqICsbvOazaVbk8T0zPdjcBzIm5UbTZtUPna4HhbXv7cfDeilBFL4vQZ4G5TKP/pBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XabZ4duL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4JhIli0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487vV1o2384409
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 08:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	InPAKn66aqiCxP/NuARC91sQ4atWXO5vXfq8uLfsK4I=; b=XabZ4duLFwxhsgel
	7a/+TtJaXXaR3qLpKpZHMHnI1Fjie81iftdEc+JHRnFVDLy1VboDn8ka7dgWcbcQ
	01OsQgCWR1e48LbJyf2haiHshDOuS5KT7fIVt3zyJVhIu0iPEYLglRyyR6MuH5a6
	z7Ev28gv7kXtmuW9qlAkFgyq1TIu8USokioLZuaqB7eoVmgag6QdFsY2zUR9Fzlt
	YSLtccQ/y3N9V0l2fPBUkhkChhy8iLQlP2x23hTUY0x+ZxL4QI3TY1J7EIXbch8O
	WCywekve74601mzNCZ2RnpJHP5B97mfU0lUbaXPsKMrp4mC2g2TDdQZlmbG4RbnG
	bkTRfw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwuk971-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 08:47:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eb530174f0so42973885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778230077; x=1778834877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=InPAKn66aqiCxP/NuARC91sQ4atWXO5vXfq8uLfsK4I=;
        b=d4JhIli0iBSrJqo+2TrWyINicTuWnVZC1T6DawOglAOpOqmXx9J0tkFZ+SjQhYIw4p
         G1UhDWHCiN+5k2rBDGJvIm+bmh15cnQilM98qDO1LbAAf54Act3olW6I8aiCf9jeCVbN
         r3NWWq7xwrtkhq/2Er6hTfDz6NjJxs7HRlrqArAjHS79VnsksKPa/x54t52E6ejZ6WeZ
         WOIunMI36oqtVPWXQsGtvz8z+IAhet4lHo/ZtN39nMvujNu4yJ69e04SLPGMPybZfbt5
         XIoRkB7Q6Sl2txdgooPDofz6syEI39WLsKOlSim4l8Kms7M9rMAWD7KB1CBJ4nsxVbFT
         wSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778230077; x=1778834877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InPAKn66aqiCxP/NuARC91sQ4atWXO5vXfq8uLfsK4I=;
        b=GX0r/pi/b92cfwUcK2dFdnVO4m7UOA2v1vJh+0hxAGOvToCJ/CAFvniWfoW6bu0rUS
         zykswYIcDVmZXyK2Jc5JY5jGoFbNi9BjbaxtM+X4+CdryWrx3rGQnRTBNdN3W/S/WdPw
         MKiTWB+giijISch8T82kmp8R6PA3AIREg+E3L9P//cxLRPMDLsVd5yvLtNfjCQGket5x
         k7tKqFDZmXMangwRi0vRHZ0zCGYDJOqRHSZv/Swqc3Arh851Xix1ZveS9p5mqZyIVh8r
         qruDQc5/b08/XWeMhT4nB4pakkgmu696CNCa68XRrM5p6WL/5FHv0mTUJst2XlCZUsEx
         P0OA==
X-Forwarded-Encrypted: i=1; AFNElJ9qxNTzqcj106BrK2WBV0SFsnxI7xcvQkNJfkCwqVEbPQcn2py/x2+5xNRhailhy5FjruMnm2x80LE/KcEh@vger.kernel.org
X-Gm-Message-State: AOJu0YySqJ/l942U1VoIlqYptOQr3yFhgQ5pBzNwaPp03kQUzUWqwteJ
	pn7nuOI21yAtrVeFyh3uW4DbmM6jA3ioZbnjYPR2vAcaR6EDwHoT/vZoNYUXYXU0SPr2E53zueD
	ZlbsOm7aprx4E/OpS4s5A/XzVmAU0dwctSSdjI3mxDrYOKFfayYTMeN5ni/6Y+QCmewxC
X-Gm-Gg: AeBDies/WFfvTGkKW6xUcCbEYZBADoPPuxoRcN2s1+Huojo077lTDCCcHjJawKu2+bT
	Y2aqzqOhbPfDhQ2dlswvYtlrQjMtditpFMNvuVCo8FpqT7wSWRZSKQ8z+2O4aTT+ukQy/anoTys
	omKMq9FRlxpOVybN1hy7jKP5DcAUCPYvu6gh6OBP1Q5wKWHRM2dRA428YaT8/6hDxEsp8OwezUU
	7HxBgMv34IvtiT4hlVj2O1j7/0aBZbqQjJXf2VbgHqOcGOrvemjSAhm/GKd3CWI6MZwrzPU7pP3
	CGRQs9DMzB01ZASw8ugIOZPvC87/Q4Lb9Ly8th4PrBV2GPUuplV9idB/h7E6qfJ2Ny7HXQoNPGF
	Qd2E15VldWr4C8Cxddccye5RqSAqasFuoNK3/vtEAszVEIQrf4odBgGaKJWwmzDv3AA4ouksFhT
	srHfs=
X-Received: by 2002:a05:620a:4095:b0:8f0:7516:da94 with SMTP id af79cd13be357-9051b259487mr1096401185a.1.1778230077065;
        Fri, 08 May 2026 01:47:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4095:b0:8f0:7516:da94 with SMTP id af79cd13be357-9051b259487mr1096399485a.1.1778230076584;
        Fri, 08 May 2026 01:47:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b8a939sm402893a12.13.2026.05.08.01.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:47:54 -0700 (PDT)
Message-ID: <a248ac04-38bb-4251-91d6-d99c21e3f3d0@oss.qualcomm.com>
Date: Fri, 8 May 2026 10:47:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: spmi-gpio: Add PM8010 GPIO support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins
 <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
 <20260507-pm8010_gpio-v1-2-3bce9da8d2ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-2-3bce9da8d2ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: inLn79ZgirLe1oVqJxLcJbrzUhQJ9edI
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fda33d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WZlt3gIzTKT3u8vpA5YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4OSBTYWx0ZWRfX4nekZIie4Ltv
 8ZouLjt4vLt4aGMMFP+ISbTDaxZ3aYTDorSoq79LlVIMGy1w9JwcUKAkBHZ6U8FCKvZ4b52Ysct
 E+/tbA+upBX4LP9F8JaRQNOooSXpXiiAdrE+Ujfk3BWijxdqPbsu1qpMfRDf4qs5r1FHTrcOAUd
 r3Qujoeq9RqkYOCOW68EZk0LmAVSDD/xTh1iRTCoxWotsRL7NhOZmOcfpOiMYgSMHqHt28Tz7QK
 EcBrnZWUcwHEIsDfG8MrscUv6owdNXs+VycqJM1Ls5R4vp9gm2sMoomw870y9Kc5sfjgWer7cCt
 nnXg26sp9gGOB1nDZLk4w6iZ3o1iKOof/g2sOVakhJMMBUlZXZSCKBbVnpv4caTXMHSf2gjUxvF
 jveAsKjATozy+aLMi09P+5rYSUuwKQVZdOlRa/SYiaY8hqoZMdO4Cv45O8M42eOON25t9afjPEt
 Aggm7RZXtzDDN/6lTOQ==
X-Proofpoint-GUID: inLn79ZgirLe1oVqJxLcJbrzUhQJ9edI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080089
X-Rspamd-Queue-Id: AC6124F3E03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106606-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 7:34 AM, Fenglin Wu wrote:
> Add PM8010 GPIO support with its compatible string and match data.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

