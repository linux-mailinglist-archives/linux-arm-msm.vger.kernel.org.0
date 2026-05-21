Return-Path: <linux-arm-msm+bounces-108977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LLKLhTJDmoACQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:57:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2725A1A83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F84130390FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1F118A92F;
	Thu, 21 May 2026 08:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYdEKVtb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gv1cN+HE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031530675C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353830; cv=none; b=bickvAcakbm9XVffzMIPYbWGgB3EjqvsGU2RfcjhQAUuk9i6eCvUcGzNCXKvGjUkigI6tgb4Q1nNHPHz8yz8myJMuiFyytMTobSrQd6p3OBIJt6bAzEoseT/vttd/bLPXy0M4dzXvK1KRmbaaUwlt0h59n+KhqM2Wl1ftq2rSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353830; c=relaxed/simple;
	bh=jR3Pgcb9LH6HV2M477w0hTjs2PvXoiYFJoaFnl+5K1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WahvSNd2RTA+anbbIr8vNmPkmV/DWc68YTQ6mczjTq/f2y4D/iocgfjELgmEF6Aeu/oySkBG/S0F30Ryj416iT8PVHl+vplbKDfm1Hn9Ge4YebLU/v1r1q1th3WoC4jxu0Ur9QTEOHjmnLwYJ3iwDQjC4g+2D6VQXBZpHTeRNDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYdEKVtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gv1cN+HE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L81gHj748668
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZn92Brk23c+Rkdb8x9LPoHnZ0R8K9ZZhsAXkeEy4co=; b=FYdEKVtbXg2Je2Gf
	1yLwj+HJ0mafhil1Y7DCB2h1IUkmqIkGt8Y7/jVhsIIACHQHAVDb1CPIda/OMQMI
	4Nuo18tWRrHVRw4icS9pud0lMfL0KoiIgQylHgVqZtb9aMji+iJOftYyE0tOMWJB
	YfcL/BhLg6EVr8ovb3BG6+FCWgmCej2FMeNCsr/uiJtEmnuC8rs3DSMXmPt/JI4g
	UxOZIawvcRKNamIpJIY0MhPfyS9aJGtzmlL8U2xpXs2AFPIO/IA80kNf8mzp7X7f
	e9Krffrb4wSx0iMbxd5dg/BZOYQz0NUEicbNDG4kkEfQQ9H+wbuwWCiqI7GKNEIN
	A+reDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6kn9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:57:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90d102884f5so145063685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353828; x=1779958628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZn92Brk23c+Rkdb8x9LPoHnZ0R8K9ZZhsAXkeEy4co=;
        b=gv1cN+HE0P0fKZQ7b+vbrRuBZjVsvgtP2RDLzFa1ghqEbf9Btxj7QcZEom1ndky4wq
         z7dNMZpmGYejPauttH+aaxIZJY9uykziqefMPpN5IHweWqhGxGsnbP0vMrkAzk7LSm78
         5NODOn0oTpl3mp8i0I7oz4U/LHncb0Jg/j2s2uWNFq1ei3y3yxekSeNdRNWp5rNSgcJ2
         mPWiXortqec7ZBCIB1rbQ81yStwI96M6c5dYeQoK2qv0jTHV7wm+BOCd4XZOBbC2yoY1
         yR6nVKoY/+94lkFcCyf//ZwJmet6vDjyh+s/tVuWz/lfDE+gi4KAg4eNle9/TvuGvbec
         wAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353828; x=1779958628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZn92Brk23c+Rkdb8x9LPoHnZ0R8K9ZZhsAXkeEy4co=;
        b=dJDH+GbnxCifs7Po4IMzOfiboN2rhZYnwNXqHds+OQ3udwyWaP2mozGEmS2CRTe6T/
         GVw2nWwB7SXRIpubMin9CHKuaCGE9zFM9NZvngpsv7X9Aad7Qq/UjKmbJ7KtMXi47e9h
         aC4J49+/KVW7IVzws4zYO2gJAsEUjSLarL59CwAA08dTWHeVQGLz4ogjMtgp7U3jhBNm
         0QY3y8vOu98e8USk2q0nSNmJw5OVqWCGaY9EIfJOp+ylRSJybE7H9DrGkgOR91WFjygo
         gKkToc5VZ7J7VCLQzyr+SnC0Qq1qBd+0z0RZZIdOZEg3ta8HB6Q3f6EAnNHBI7YpwYLD
         awSg==
X-Forwarded-Encrypted: i=1; AFNElJ8Y4E/HuKor5U7RUzXzMfOtG6i2s2cdQFFmKcqLIPVEgC9XCiHXItl9nByzMjpTdhmQZqWXkWFYw4xZFzre@vger.kernel.org
X-Gm-Message-State: AOJu0YxTi6jVMlAPMeVss9iAfrkC93wOHbGzfNN7BkNnLAh/b/JxjxyP
	GwhItG52CQnz+mc/lwfgvsdmfEZgmDYyjdTJEswdnt7hxMI7IIfCp63RL1WWyHT3uQse3zrfY/V
	h6cEyamixgrN2u0RIBGqY2hZdvj6mVIjfiBX2hOWsRy4NBpoQzPg11hUYsPp4iT1qm9XW
X-Gm-Gg: Acq92OH/1ewc0Cs9HNWArBDWpEOR0w51vFoSVFcrSn8tgKg+7j4P4IcjKwD0WxNXtwK
	n2quDZL6+SVsM6pqHx+J8Vxpg4kN1+MjuLzVqccXwfmBowgodhYhPe5fOGoAuF7hZcprIE/nAiM
	BWeHW0FHIf3pe1W2D04otqhDX6i6RKZ/QMUp34XzAvqzI1ehBRBzeqHL6H0K8MsOzo57BZ3igU/
	eTGdz+7RyWshhuYbSKW5WY7AyaaIRKLHAHi4E9up9DjIzjyAKsE/Nf3Ej/UGSZU6XIe3tVIYFPQ
	jgiWsB4iPUGMMPk4vN2k54X35aOHsO57e3qQngOzA7gTnRhuYvwyTaYJLvrOqY6LhRDV08r5bEs
	/WfOR43QYNq6Rz3Feu/3QFQZjA1He3MfLPLx72c9fr/ap1tp20Cdd9JGbLS+71yQPrptf9G5PkP
	62V1E=
X-Received: by 2002:a05:620a:f0e:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-914a2d1f98dmr155678185a.5.1779353828098;
        Thu, 21 May 2026 01:57:08 -0700 (PDT)
X-Received: by 2002:a05:620a:f0e:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-914a2d1f98dmr155676285a.5.1779353827601;
        Thu, 21 May 2026 01:57:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc88371cc5sm18301666b.28.2026.05.21.01.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:57:06 -0700 (PDT)
Message-ID: <50ac0298-7cb3-4692-913a-761f38da455b@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:57:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sc8280xp-arcata: model the PMU of
 the on-board wcn6855
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-9-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-9-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ec8e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=S3QPRrZGCkirkA1mjOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RB1a28iOIo859uTxOdGAAsz--6vYwy1F
X-Proofpoint-GUID: RB1a28iOIo859uTxOdGAAsz--6vYwy1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NyBTYWx0ZWRfX9jf86tQHIWt7
 AlGlQZ53uzsRlVgkQx1TwhxHQV5p1ts+9/pBit5b22jW4oTbAsj0UMUOyTbtCegcBP+L3KoyGTj
 YSF9w2GyEVF/uUJq4Pc91clqsGajz3FbxV2sIAS1tlLjS9/YfKv95MXXzGmWrwoXGWMPXEKvfnn
 DZ79qgGVYrBc0OqSHEhhoDzhH3pdIOtMMAPJJGqj6Xp90kX8my6DmMr8GqtJTlKMiB8yAxjnMQY
 X0ugCQ4Lwd8EkEwJ9O4S+dTyLPAudb51o06YGu1imLMq6lqGmqdtujsutBjh0QOw1V33LP5bBZy
 ZJHn75dOPsabY0LB18JhiuuVQAAIYn4+0wl5xv6YmwU9WDAthWOegqJH8MVRe1+Q+e1YQAOUepJ
 LiTKElVcgBsswDcaZBDUOTJuVP0l9BDfMgSeBFNCr6PKf0rEPjuRckvTodLTAS//Mfogt53do76
 CXCWuVZ177kmfElC6Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108977-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A2725A1A83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Align the Surface Pro 9 5G with the other sc8280xp-based models as done in
> this patch series [1] from Bartosz.
> 
> Add a node for the PMU of the WCN6855 and rework the inputs of the wifi
> and bluetooth nodes to consume the PMU's outputs.
> 
> With this we can drop the regulator-always-on properties from vreg_s11b
> and vreg_s12b as they will now be enabled by the power sequencing
> driver.
> 
> Use the fixed BT vddrfa1p7-supply supply name to align with bindings.
> 
> [1] https://lore.kernel.org/all/20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org/
> 
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

