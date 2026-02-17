Return-Path: <linux-arm-msm+bounces-93095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FtiMLy01lGlpAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:30:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6212514A677
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBCE130263C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659C130BB95;
	Tue, 17 Feb 2026 09:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8SqrQvo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgglYGlb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5174030B527
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320616; cv=none; b=lQERx2fZObgnK+Vj7TUsDH6yj2g+bChRzic5YuSjab+VLmZyPDQTAyBbcs+wCLuaEYp5kKBdb62hyd2RPky8QCDltxmgfDWe4if69/2hCEGyxSuoK1HFNr4hIEJUBIQB2KFox9iU48PIxdKa2+9D3v2pG/5Gkeezv3AOZdMAsdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320616; c=relaxed/simple;
	bh=skV8kT+3vjc4iwJtHVMjMX2HnTBCJoSr3evL57N/Wh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDeInR1Oq4Z5CaYXGqF6sCJ83Ec4EoBuoSdCSXthl6g7Y44ku9crM90TCi/AyKZ3JhQVBj9HShunb5byUvC//vUZ11XARnumM8YjSaTKnfkiBX62iMwhUIHBIcwrIpH7vAJcxSMeRcZ7XLRWaoxd+zfjgGS+GVn5bxnSHGxxICw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8SqrQvo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgglYGlb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9MHK7985268
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjowmJEACZ4xRadd4NQnWlKmWRqtaHYf9/5saO/OcHM=; b=b8SqrQvoYO8x3QNq
	FSvsUnctG4ytsN4xTokHn0KuVAp9qYcakVVTvkQWtF4FIQmcuJ10BnL2ayHjwn5M
	Ury8y1MGmWO6PwnHM0Roi60D0L4ja268iqAUZAoVp5PsRWU8X6Y3Fvwo7fig7s94
	LnadpKGPxND4FSK4bPzxD/CmythYLgyNsvMXZAvZrpeEoXG8sACp2gvCTCBuy9dr
	JTnTUXMWDBHwSG2/WHO3DWPjut95rDEPpJn+pcWRziiSL+GBpZQZboUYNbLAtj9M
	phVCrx5dFiu+0ntgThjyznFiG2GjzUX+crUSZgjXw7R6v41TTlAMSFzoKYsa+hYj
	+NQt/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1pbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:30:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so308393685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 01:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320614; x=1771925414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjowmJEACZ4xRadd4NQnWlKmWRqtaHYf9/5saO/OcHM=;
        b=jgglYGlbf5GC39Y/iCwypX/g43T2GT3/uh0zR+DyF4Jjmw2XzT7sg3FDZlppB88xtd
         WjYm0u7c6PRdsgeJAfDB+09++qreK/ak0wiTqYoPCI3GM9X9syadhBbGMMv93JsoG6VZ
         VogLCMqPXHpgS2okDQxgCuFUVN7oc1W7hNK8EqpgKP9Hp0iAsPppv/2tdBP/dvs9HZxr
         MluQgE/hzaT7FtvwH6LsBKj+ynMeeAvzuEJ86rDEC5vHIiR6hn5+u4mwRl1MUirryRE+
         XKOM/NBaDywZKjyNPasYOUsCRYGTLPo93HS8CJT2CfVdgPvK4J0ccFzsmxOslcWjNtZ0
         nfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320614; x=1771925414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjowmJEACZ4xRadd4NQnWlKmWRqtaHYf9/5saO/OcHM=;
        b=J/nrgI/hUh/sFk+OuaRfgXpbxNulE7dsha1rfpAoey3zrk0C5XcER/51LHDanqZGLk
         1I9fMqzJ5BNZlwHItJjQStsKJQWb9yMEP1IcAh7PIDYpRqNL/sw6HXGdg1QrMqvTmBwL
         Eu1UdNUjp5UT/HRPpX/NGaUi/FT5kkHl+naPq3LaDaQjojv02qMw8tR4l2+slSQh9aAg
         R54b5MsbwGBqnZoqJ39sonUHCsjUpLn/fogtp+nfFcsivCCa43aO4hvEBmzKoJFoMmlJ
         rpBMmsH4sbA6AO97ld/S5Bdd6T6iu2DI3yaXtpMxZZxLOsHIqMCdBg1M3qQw+OJo8T0/
         75jw==
X-Forwarded-Encrypted: i=1; AJvYcCXzxjwKDGM+HBOQdJFA9c554Sg6CQvSzMARmPlxfiOuafWBAi10fcyLkodJWDk+AQn6xAlwM76Msx3TDah9@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNb6DeLer/SihdypHtzPgz4N5Hflqh+385bNxF9BEvtCuF5PE
	7ATK60zyYVf9ux5Msu5uPFsbkhEvMqIHGuRwYGlooEguoSbSKEYuAGo41g/nC18YBc23RuC+j9o
	7FpSWs4Y0Jk0RV3rNI88ufbNnt7r36tKfWcrfQ1ckSNxKZtc97aus8gT4nWniAsk0hbCw
X-Gm-Gg: AZuq6aIhNmt4hfQKniX2+fv3fROnZCQkCiXxtOLG6N25OxK1aGWUuvaQZgcGBvb1gYP
	k9H4cwNL6JWN2xEcKY9bJ3m5VpezjhMwKw7HsD5fJZbSSv9b/UNy3wNVrRi1FO8zdxn9IBzCKXb
	NZd0PBikVg2YmrGVQyT2itMDL4e6SHZvVHtHhN6TkCWNZsk9nLUwKIccKAdvEMr1QUjn7Eqps/K
	2ySemo6/3m42NO8OyZhpf3APEHPyAsJwMCkShCeJf7VtffXExOfQpnZ65/H2SZjMuii5oJFB6Ua
	ojc4QNhGjwQcfhA1so9dP4e/1zG96mmeVtSSlo218R1ZKcNdtaMSzQlT98fjycv/Hm4LYiEENNq
	16mHE/ScmYKqcDofy+K19yXq5X+s9Y/pesHNj/BMdLhpXp4Q+okh7sRjWh6OlxIPYzbNy+25b5s
	UMcPc=
X-Received: by 2002:a05:620a:468b:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cb408c8f1emr1310199285a.6.1771320613630;
        Tue, 17 Feb 2026 01:30:13 -0800 (PST)
X-Received: by 2002:a05:620a:468b:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cb408c8f1emr1310196485a.6.1771320613151;
        Tue, 17 Feb 2026 01:30:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385e60sm332576966b.19.2026.02.17.01.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:30:12 -0800 (PST)
Message-ID: <edd3076c-c1e0-4b01-8039-5f01c6d0a019@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:30:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sdm670-google: add common device
 tree include
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217000854.131242-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OCBTYWx0ZWRfX42x4uJaWI69i
 yu/A3FDP10uHkQaqGLdqDeMq22qRg0+SjMILLcyp/oBKlUy3ANHNe3qerwvfBZo/hiAEsqL1X/3
 m1cvgGMQpYvloZM7RAGuFLB+/f1MbeN9KRfkl3DcP7H4WXXzxzNNqAiKTOBYK4tu4FqQD1KJHZM
 juYW54mG3YlcbHXLA3X2sFYfGGvu+jhi9fRA6ksGPhp3LY/dR0lYGglfUNRJ/e+OC9hkVtqfRFB
 st8iBTSFEOSd/sIJYodw+WdfjXrXEfKY9/8usAO3IeHjaJgIY0yDT4YD4yuHgFCT4Q1sXX7CuNU
 tuy3uMqjXhXJSf/yzG677IYJyX7G4sD3o690rtmQQ8SeTy3lzn+vbEgTcDLRsnTqHe0fTqKyobH
 fNDRYIrwDyyW+WHgnkgSFkyaMUF/P5cN3l/IDzMqE1O+NvTZkjP4crX+VML/tSNGj9dqbaKcOBn
 1nRuhOowzLsyMs6EbUg==
X-Proofpoint-ORIG-GUID: yP0U0gfKKoHb2VDWXQ6vXTOL6Ad9viLc
X-Proofpoint-GUID: yP0U0gfKKoHb2VDWXQ6vXTOL6Ad9viLc
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69943526 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CksTUBHohfg0KbD8FugA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93095-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6212514A677
X-Rspamd-Action: no action

On 2/17/26 1:08 AM, Richard Acayan wrote:
> The Pixel 3a XL can be supported by reusing most of the device tree from
> the Pixel 3a. Move the common elements to a common device tree include
> like with other devices.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

modulo these disables

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

