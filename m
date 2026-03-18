Return-Path: <linux-arm-msm+bounces-98364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNjdCkxyumkeWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:37:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE642B92DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF2D9310D23A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD1C29C33F;
	Wed, 18 Mar 2026 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecto1oXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwWPbkSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841CA3AA197
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825874; cv=none; b=RF9PybDI3HJiNHOOfn3amAP95dBFk+9Sq7B16Ijn1OA0z3DnWYcelcnDUnbtmfKBFlDIMyIlCaDw/m+TOACFYGmUDIYaYJUaJTS7/m8r+0qkKiuVZpNStEp2iqAJ32KiRgtgUWrhEx5b0wxbIfgtTi/DYkqz++8mmHPHQG/ItKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825874; c=relaxed/simple;
	bh=mKpALUSNN+vZ+vwSIY8NP+XEDB2kWb0Nbss+jOmN3Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9hplN0zrJ+UD9dFsrwsc9nlRJjfMLGcvxH2MyzbpDdmtPwwcllovffEBGmjlIy6JReFJX0RV/ZZ3V90o0z8cNsBb9UJ5i8OVzsSCnk0ggsvV/5YacW0vOGJRsJJR9btveDNxGr6HFxoVbc6AugU8p6773j2mPloRtWhVgEKKFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecto1oXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwWPbkSz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I98a8Y403286
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mScTVSflKScsMduaq8uFre2oakEknzUSovCM8gwCPbw=; b=ecto1oXBVXVpDc0T
	ZHgRvHx09hQ1mYXOyO+5KCzAm9voR4goMlXdnNchyi+sMvbgneHvQhWumENqatF2
	nSGfvX0t2krxoYDQbZ1nhmnUODN7/78odGoJLr1jb1n+FsiHgXN0Q8okij6h8JVO
	e+/S300VPBnAlFQL0Rkix+to5zwi6gzC04oJaQaNwWnsds350p7rAyHPgTSB3lJP
	7tG8W8/g5DkMYlLE2cBdKMG27iJZGqu/GY2UCT5PSpTWjeY6W5K9vN234GJn4oG3
	+VBBagDh4c7Z7han1GhVoc6cmsmAZV9Rmi0YVZj5m1amcgg+7xOvkVDBnpKEv7Km
	wHsoBw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4du2vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:24:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090114c791so49383371cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773825870; x=1774430670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mScTVSflKScsMduaq8uFre2oakEknzUSovCM8gwCPbw=;
        b=UwWPbkSzmFBc3P0Zn+8rqYVzWUobFY7qWtJDYziWU5eTGup7sHqMf3Ngc6GNg5kDxN
         Fao6kYs6QDGt3dQipBRKY82tW/YcQb6bXGGH0k9XscXU2JzXuq58Ow4fDfg/uaN/8yLd
         pG7pc0c9muw6CLgovDuviGNw5Ufj1cH5eTOSxbMoeDVwZjoijKckj53ST3vtERTUBMec
         CEx47jpSmiseKkmlMsfaa4lUP6tbwlrd1phsud7c3AgW2YtyLs/gk8t2H0f05Rvob0j2
         NopqklVntbBae+hTZaAvhNxunYlPnp5rINViqgrY1uvAIaT+pH18UM7cpX+1/jdyE/hl
         PDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773825870; x=1774430670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mScTVSflKScsMduaq8uFre2oakEknzUSovCM8gwCPbw=;
        b=q9/8hS9AhBcfpo949vSUfrpjfOLoNDZx1rds8VEHppE/gRI8KcuRh6EeZO+rgNvoy5
         VLMjxVLGTvVu4bfEQdMNGdZNIyA3hlvVr+xAGsZMgLIpDiEV7VcZB+gwJ/Bef5mmld0/
         1KTQ3Y7j91/O1w0c5efJibJFUvTX7fTfG2Zx8BIvg4DhO0nFvIg/WczW1o2dv+tWvNYJ
         99C24QHfQDH8Ef2gTlaI1fb9EQCorEtj79gve+mFdb6lkHpndiW5CO66M2o+47Qbr4tV
         LLys1mioS7OOrVKk2DR4ag1X96J69NPmnwMqM2Vct353MWgYuA/DbaFJDUGbAowB1MzQ
         Z8Gg==
X-Gm-Message-State: AOJu0YywkxZnJaBShqVo1FduDSTO1RA5Eg1x4688y6QxrE1J4h1KZ1Ug
	YOh7TRrdT1X0zBTkhpDRXOj64fMsYEMXcas9SvyVqhYd2XSRQxsIbVB6KvXfHhiiDO7i5iQqo1g
	MS8RrDyeWiFJiDA6MjszOxPbJkK6Pi/GDwYCpWNP4omwEWGDAY5gmVYIhw4my/q2DEWal
X-Gm-Gg: ATEYQzz5gTTJCTHd0deQesG/KUWewi07nOeISKOpW5t/oZmlN+K02QjPft4MODgUecI
	/FChpK3EQpDT6MKGNkXYfBS4fQpoQqx2Fgk2RW+jEpAgTdlqVo+/jdV8ZWHtedCyXRWcJhBl9xS
	pZF4VGJ0z/m+jz7cqC1mlU04RJTiWzxXQHwRmwkSOQC5PHkLleQXYrEcEx1jjAhdlBv+o8CTeAr
	DfFChB0ofimZGxvAYIUqQtypHgVld4jF5a96hdA88W3F+idVKvcYtbieKqOut7AV3PBQuAiyHuq
	GXdOswLsrKdk7wFnfYOwB1Py3J8NNstriwJ5xGiS0KSJO9iwsFka++Pdin1bn0R0U6czr+Cg1U9
	9r4/uVAChCNNZJQpYoHzrWSw20lwa34Mz27go+HKt+PE+0NPdLSfa99PRzl90GnEUVIEJAhXcPH
	PW31w=
X-Received: by 2002:ac8:7f4a:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50b14906b2dmr23415831cf.8.1773825870000;
        Wed, 18 Mar 2026 02:24:30 -0700 (PDT)
X-Received: by 2002:ac8:7f4a:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50b14906b2dmr23415641cf.8.1773825869500;
        Wed, 18 Mar 2026 02:24:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1751cfesm162094766b.63.2026.03.18.02.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:24:28 -0700 (PDT)
Message-ID: <9adc65b6-abfa-4046-b029-1cf112c5256c@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:24:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com>
 <20260318-ipq5210_tlmm-v2-2-182d47b3d540@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_tlmm-v2-2-182d47b3d540@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3OSBTYWx0ZWRfX0o3uiqfAFUDt
 X3LVhTDhlgchBvSMfgOX+Sk3coVPdar1YXWq4JkJ/XqTnMiffuJRr3oY+2kNMX1ORP4Wp3D8dCh
 6ByU1k70R/vz1JkxMSzNGdIgJWxBn+aXKWlv3B+GzEhz3BROHAr/k9I0nkCFynDwSiCSFstQSVw
 wK4f4ngNjjZ9x9m+8wYUDIZzF8LVftYdllUCdkfD1sWyVfSMyN/J3ok6QcHPVIPSFVZvuo6Pz1e
 ch92n/Y+L8L5IhLKgE5jILzqrRSoCMEDH4ThdByIqAoHdzXJgef3Zc79Kvg6XE5ha6+wmODtl7w
 eFC+3mpHn6n0BiJVOI8XcIslRbX5Pe8f2RUYyQXOLTE6R9uErKUvVNzKO0+L6UhJuebqxAuv4Lw
 rmnt5ZfoOOKulBmfKyH070bSSrwGPzJErrqyR5GWhnmOrOqfJ6NVRYs6wLypzxWqy/U+uoL8zBi
 W4XCj2XM43yFz6qPXcw==
X-Proofpoint-GUID: YwKCtUNA0mgfiyKm9syGc1UJr2zTCSZp
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba6f4e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_mKsZQhdUJt0vTTU-fsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YwKCtUNA0mgfiyKm9syGc1UJr2zTCSZp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98364-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BDE642B92DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 8:14 AM, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

