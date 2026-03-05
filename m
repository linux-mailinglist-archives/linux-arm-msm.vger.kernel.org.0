Return-Path: <linux-arm-msm+bounces-95578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO3/MfhVqWng5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:07:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF320F686
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1E6E30156F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA4137CD49;
	Thu,  5 Mar 2026 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kN+AXckW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXvkO5FT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624C837C924
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704937; cv=none; b=Z7N3kKOACVUEcZamrMraLsZLN90cmy14vez4jJrssWERO9gG4EfPV1GvAjQlMz4ElZiS6RO2n1WrQGkIg58BKj64+IrZfn8Ti4hyzxXrGlS51LcTjURCrrZO15Kv2oGPFrzRlQFWYAsEm0GyHdpMY3HcjZ4GSXZJM855RxFo2+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704937; c=relaxed/simple;
	bh=sdqAqjrVvRH62b9KukgizTgaTiOnXZlSQR1sQ+H8r9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJaM607ausBEZtFV8u4KUGQh2nshB457LZ4Fe61aiWdU7VYlkQDaED/1ISnJnle9WtiC1VcCH7BIrbujVj2tXYOz68nqgNbbtVlr9myzUYh8t+iPG5VwkQFQdOSlWEj3yOg77CeKRAm1rEaA6aGsasPMT76brGnKmhaGi/yP61A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kN+AXckW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXvkO5FT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62591VkT628695
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 10:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=; b=kN+AXckWrGaNHZZm
	jf4xSJd0s78PHX0x5FJWfoVPPXDSDLvHXVtpa+lgGAbrzrK2xS6zVQ8NakKmGYAE
	0Zrfiog2BU1++B7ORhtLrcHsBEwM7UYh4w7hsovbto/u0NFLFW5u93VR1M1Ryyhu
	+WtN6Bd5Dh+MC6fZk97UHDvrhnrAfFmWFS5e43T0BhqqTmPzgVXdfQk+FWZ0Ddjo
	W2LjCX8ckVom4jsE8Gpt/s0IKTv1RVKN1j90DT8bmHL3VDLetzptu6FCsjg4J3JD
	Qcv0QjKMIM88rHxsDoFHi1hX48xX3mdtVErfjjS+AzLxCnX4Iq2Yco8qfWXdlH8r
	+RrkVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m2ur3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 10:02:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb399597fbso468229285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704931; x=1773309731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=SXvkO5FTrFe5ckp1eyNRw1nsTAXIcxIeZQqrBxe5FuUTHN8EQBN7DqFLXcoVofBa+f
         ouFz7jWMvAeL+UawjmPmo41JSuzVaz0iyk/Hmzzux9bF8LSi/oejwx5HkUCRKgfeLRy+
         Rj4NwFPvdBP/CZWOOvHH+Gp0QwVF9mVaXa5QK+n2qIFCv9+QpS37Kw0S73b0JmhGe96O
         /EcDKEikklDdUhKLXqLyDpaY2M90+tcvBgZ8r7xOmsx4U+K8BiseTX1vhjb46CgT8ycO
         cSy0hgQ4jtAI46GT3pff8nakANCpMOfJMtdSOW5aWFwy3dYI2SYouhQ7eiQrZdJOQwTG
         6aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704931; x=1773309731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=ikwSsT8d2vLLnkqiwCsNeLqGU+nAzGhO/uGyal037LHX4Qlc0WPtuRMOyeJdTo0iTq
         umezWn/sVzE+E0HUrh4XXU20530EHEg4wUsmfwYo/rhpY6nNRHiqLzRN6RAy5UYV3HQf
         KUqarneH4SZa1WH3RGT4WWB+VJy40+lOhhJVqSj4V2p8AlnX3r7NEyjLBRKPqjXlXjSP
         xsvxJs0kjM68z7N29QzS5RM8aqGeTv49eLfFBrVdJHmBz3/EEyd9OWevjHOyPIdMEPW6
         ZQsvqdlEg2K8QZNS41V4sYwqWh881/faj/sb98M+gIz3hTmAE1ROUy8utjHb4rIAopGN
         Vp/w==
X-Forwarded-Encrypted: i=1; AJvYcCV9rbUMkAUUaetMtOf4n2RLeLpKhOAkO0enomdLINC2VZe7WUCM/wFjTthIwk8tkkjc5TJODT/gl92pDCaG@vger.kernel.org
X-Gm-Message-State: AOJu0YxooUE8Ro5u9JWAUfOwxGwSSSybErk5dh6UAQCApqucbbML4Tvc
	7A0i2teLaxX9jR1hbcYpxyO1vMMrrBMxFqDwnI0amBt9rnc9vGFldfnNVPAaGAakJ6ki0bGm/d6
	QDW7+w1HOx1Utdup7HbWZBWtCJke7wfxvEyryka8ru+Vnd0PKsegpNOLVMA4OuKL2rowt
X-Gm-Gg: ATEYQzyyglMGVgGusyx8qtsetzHHlkdWthYKP++PKN1RvsQYQgy9CTk9qQZEuu+nMDk
	7sbd/o5kfvN5hp8vPC7+ktz0oRo1rSB6x7lQ38pN2KrvmhBy+PxR2X29doDXFlxtpgdTw7OmYYB
	oBpPTL4zpuQWEocHW6djm4C5QicNUPjmbdL0NqdWXoGzl9wu3oELmmXO411JVwImLiLp1vQm9fq
	UbuIbwHMiTG5yGGja8xO5VU+kWHQbJ9ft9uGWbXtdkfI3gK8xgzVMKXUIc1j9+oZETJfvFuX4fG
	8eFemX/ezFuhLgQFMFpTNb2erhPMOFWGj/obzrSYWdXGYEEbpx+hA9Q6fOq7iKR3Mv42es1agi/
	8mQR3oex1MTMy30oQ4w4bi5JJUwfJfnSqYII8WSY5qTRpCekVh3xafPCigytQP71jGGJ7YA9lM7
	pmxE4=
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443240385a.8.1772704931618;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443235485a.8.1772704931010;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm870864166b.61.2026.03.05.02.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:02:10 -0800 (PST)
Message-ID: <fd00e0bf-7b73-49fd-a2d7-1d4a88bed5e7@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:02:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Drop CPU masks from GICv3 PPI
 interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a954a4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: TUc94D90Qd05a8Nz4bHGR4Gmm8asrWvf
X-Proofpoint-GUID: TUc94D90Qd05a8Nz4bHGR4Gmm8asrWvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfX3PHdo2que+Us
 vjo6oSEzgdJTpJqZT3+BOhFZwqsAE7KP3I6DM5k/MUn4AF7TD0b3YA23t/v6rwHDK3DYZH7gBch
 5+kLDiSayiZvn1VspED1med7CqFu06683YY4c6wqShEj3WlK3w0Gnn0kxxU1Abhfu4ADVJfbxRC
 lk2dwp6t/ZtxQZzrC+kY1oC9hsnbATVN6bAVQhISGzg1tqraqupMhRFPne6V9meN/V3uPk0qTTD
 eWAJQQGBGIoQvEagkE1WaXoJv20Y2zi/gL8B5dFrXlgFYyORgyq8H6C/FyLtvoknX3adJ8jJiIv
 YueU5mWT3bIPYoJ4EiNfHZVrYS800WdHW/YA99jMrjASzhci4PcCIwXPYqkFYzxgajB2gi8zRIv
 69dVYNhr7RgPcwUznNvYjGIOL0z+Ma8Tiyiqi2MQYT4KpvEmC0GQACjibQBkkjaB1kCWc3Y8fCn
 kVKD/GngLUKQ27ivVLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080
X-Rspamd-Queue-Id: 3FFF320F686
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
	TAGGED_FROM(0.00)[bounces-95578-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,glider.be:email];
	FREEMAIL_TO(0.00)[glider.be,arm.com,linaro.org,baylibre.com,googlemail.com,samsung.com,nxp.com,pengutronix.de,gmail.com,kernel.org,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 6:11 PM, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

