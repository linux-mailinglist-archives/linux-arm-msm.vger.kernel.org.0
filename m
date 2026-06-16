Return-Path: <linux-arm-msm+bounces-113401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W5LmCAw9MWpHewUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:09:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FA768F224
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:09:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B8HHmZ5I;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UdJu292Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113401-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113401-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07C3B313F160
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABFC37CD2B;
	Tue, 16 Jun 2026 12:08:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4E843CEF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:08:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611735; cv=none; b=Sj0suUyNPVXBr8AS0fYOFGv3jkZb9yE9Uo6LlZf0guFXR7/Gn3hQpKA6Xc9RMpcc05mYnuYQU+pgIH4/FJ3PGr9UMivrczf1vxOptXztfjue9/EIwWEF3sn2fqcJUrmZQ+lXutJm8K8uSG6rBjngaK/rNRVh+/0XCFGdkV5poq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611735; c=relaxed/simple;
	bh=IZhPK19RPTep8vCR/iI+/ZRMbR2540jS3A13ZDFXbZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7cI16MNEtv3XeMTiSzZreKGWoemv0uGQU9eVdERxAtR+xwyHhi8I+8JhO/ghiVHqcCObRgIZ48UgmrPaLteRotPkPt+Dm8xVgFHNJcljRw/KAN4z1HCceQLmRRJZp5Z6EP5K2vUI9oN6APyd9doQ4XWNdqBZTHp7kRPL+5ZceI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8HHmZ5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdJu292Z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9GhI248271
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sjHg+ZVqRUaGbwJbPdqwnI/I306Wmg8va8QLePtTBs=; b=B8HHmZ5IdwTV2kJz
	4l2F3g1PRU5YhbVq0YDrzIxCRcZaZZrwsmffOiSZuJXUTyfFCFEMERP/bIR09is/
	UIr2GCm1b0Sp5+9jJZuXjSPgLRDcY4NWR+VcRE397Z/rwv8sjzRVT7i+Ryni39zo
	UmEOrtcMK3ZZ9d9FfGzUpKJHt5DUC+3l23O6NjuROVTeu6QAq90LKXIxwlPxc+aw
	OV2EsNWXO5bBBhf5DDqTkpxwsgOTbvNcgweQqVsGgJGR/XUv1v+heQl6PW67kfhC
	Kh5M9N2qG4S4tjEEeyAUdE5K6QwCLmzpvTBz+NAYCfhbchq97NOVvihpPsMj9sUr
	SFV5qw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs8wr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:08:53 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59e5678d46cso256982e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611733; x=1782216533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5sjHg+ZVqRUaGbwJbPdqwnI/I306Wmg8va8QLePtTBs=;
        b=UdJu292ZMM15L+hSX5+zFoJV448Toxe2+idQMhrwywlnfn9uAUX+i5uz21HR2ewOKU
         5FD9Kl08s2x+p3zv6dB1Qm1+ygtIjLYaEwEL6rpdoREwfbPU3KaBTuASA4LwFikssNAg
         u6z9rTHUiaSj10C44jtGzRbE89Jt7TNS2biJSlDu2CleRKFbDbE0clIeDEMlxIZpoxdK
         KKfH39aacVmxxMndD1evT6XQ3BVx60DgZyWcRlE3wtyZLcBwMLej8EU311J+iRwdLHM+
         2ZbGYDmMJMQcBK+kcewN7w5crM5TuwHeOmW2sZlOMuSjPrR18hHguxvE76J67xVtIjNx
         zuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611733; x=1782216533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sjHg+ZVqRUaGbwJbPdqwnI/I306Wmg8va8QLePtTBs=;
        b=s68PI5lwxm+BgY6cnmtvEgGUIFV7fPqtY3PVGhqwiwaEB0wvGe5v8ie098kSVO42BV
         HpMGB9VpgyGo10x5JPSFqeir02B9L2PEtOZ5c8KPA/5Jy8YUoVWcjg9XYS0X9M6ZiIE2
         T4zl6FQX6tGr3ILJnImXvU822M5LQjQqfdWN6wZJKAEd8Tnjw/BoWsXSdgEUEc+s8qN8
         OPBIZyqwRUOGeb7eK2EFoUK/pzFHzwhtbjDjuvwsDBZ2naMpmZPu6G34PUOxucIV3PY9
         9kXnoY+ygH2Kbnp9AXEI4MLHQq4ne5L3EwHVyF80LvwNM4BqtEhkwbXSx+JP0s5VXBNP
         PEFg==
X-Gm-Message-State: AOJu0Yzb3E0nt1SISINEzt9OjOn8UvHCoeSXwvWvngXLvSbcF+TpsC89
	3an7IOj9EwAAyOPAi1e4lGvq71Ua8qmShkgDLHBCaDs+7+tR0sazNb2G0xUf51LY6P4Z3hCVMGi
	1nY5koaQviABr+sRmJW3kclFFxKd1JmecImV7FvKUh0rPpDQFDyvC3HWQxT8CCumevBjw
X-Gm-Gg: Acq92OFslso7+J+DGAdnq8/8yIaR5KLz3Th5wb18JlT8IQzlmbx1VOyetyt0tmmmvqi
	WaOgeRxi4i7Q2/bKhAmuWnqdOKA8WlGz0JLb/GyZ7vIz3OvMsSu7eJwLu47KgxCuUAzc2KFpbGa
	Xw2XoLYZZAYZfzv2jdhIw6fFs1ImEY8V9VZFsSUIgTem9Uer0nYt0dQ0njI1O/hDnsNUxMmIo85
	Bheyr+hqrgEAqgkkY5M7M066AS42kbwRexsd13ZJF63wm29fZClbW9Y0YoGFoGhhXq529yXGtEF
	OPB0+1w8B9Q63ALmzaYay91SxBm14XK1XQLTUbc6Xp+tT6oGMiD4H7RmS3mrf/viXPElzWNVQlU
	xALH4r0muu3XQzYvrC8eUHQsoOpM30u8mxZfKVfu6V6OgOg==
X-Received: by 2002:a05:6102:442a:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-71e88b61ae5mr2831030137.1.1781611732591;
        Tue, 16 Jun 2026 05:08:52 -0700 (PDT)
X-Received: by 2002:a05:6102:442a:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-71e88b61ae5mr2830875137.1.1781611727381;
        Tue, 16 Jun 2026 05:08:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c01ee8286c9sm350078966b.5.2026.06.16.05.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:08:46 -0700 (PDT)
Message-ID: <8bb365dc-25b4-4fe3-8ad9-1f110bad2417@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] PCI: qcom: Add link retention support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20260521-link_retain-v2-0-08ed448b081c@oss.qualcomm.com>
 <20260521-link_retain-v2-3-08ed448b081c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260521-link_retain-v2-3-08ed448b081c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cRYm3I1tehXIvG9_TxuGWXHiE3OqECjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNCBTYWx0ZWRfX2NrS7W6/UQFn
 w8jSrhNQ1SgBdf4/pD1jznas8Uj0EIx3jQOAq8sfvwfHVq8eLqclUjBsfA39rL+yMi28syz02lV
 Z8JA65jeRcLflkiEfdsZ8GINwUm1Tt9kGT0NaHrK5AL6lXn3bignPzbcKsQlaa2HnD4IyGrLaPF
 TCuqTqe6jjOAUCTCo2sPHY9hBviAC4Es4K3J1vY5v3TYwOUtqWBGjcW750MACP2HZPDyfveVc3h
 uj2RNGhmjePJ1GAbYLdKiTbSeGZV+Xfo0BtxCKV9VKo+Q+QQ6Gbr9F7rsN4Rh2hqwL62ia3Hzxg
 uDWuVOSbi3Lm5P2Jn8O3v6u2CPE2qLHaxHkDVZw69+4Xh1Md/jfVO8CCSgwOuHhCJztlGXALUcc
 2EOdkgnYXwYMllB8n3wm71aamGVW9PBYC4iE3BUlqE63Hyb9755tDtVALkaT31kQjLGDRvc62k/
 LWQhZjVlTnvPAqrt7ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNCBTYWx0ZWRfX6za7/TKEeabf
 dei6LJ9ZkIS9nRus9Sy5Z9OIiqbPZeTCyiaYVRJgnanm5WTGsI3FNOjX8I8e+F+FkGuOzeUAT5v
 eByvEk/AAabEpiHaeVVd+Bz8dnKyuoE=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a313cd5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pjaUC6Pc4IK-3t1tjCkA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: cRYm3I1tehXIvG9_TxuGWXHiE3OqECjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113401-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85FA768F224

On 5/21/26 2:56 PM, Krishna Chaitanya Chundru wrote:
> Some platforms keep the PCIe link active across bootloader and kernel
> handoff. Reinitializing the controller and toggling PERST# in such cases is
> unnecessary when the driver does not need to retrain the link.
> 
> Introduce link_retain in both qcom_pcie_cfg and qcom_pcie to indicate when
> link retention is supported. During initialization, check the LTSSM state;
> if the link is already in L0 or L1 idle and LTSSM is enabled, set
> link_retain and skip controller reset, PERST# toggling, and other post-
> init steps.
> 
> If the current link speed or lane width does not satisfy the constraints
> specified by max-link-speed or num-lanes in the device tree, fall back to
> normal initialization and retrain the link instead of retaining it.
> 
> Configure the DBI and ATU base addresses in the retention path, since the
> bootloader may use different base addresses than those provided by the
> device tree.
> 
> Also fix the -EPROBE_DEFER error handling path to return 0 instead of
> propagating the error, avoiding unnecessary cleanup when probe deferral is
> requested.
> 
> Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware.h |  1 +
>  drivers/pci/controller/dwc/pcie-qcom.c       | 62 +++++++++++++++++++++++++---
>  2 files changed, 58 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 3e69ef60165b..be6c4abf31e8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -450,6 +450,7 @@ struct dw_pcie_rp {
>  	bool			ecam_enabled;
>  	bool			native_ecam;
>  	bool                    skip_l23_ready;
> +	bool			link_retain;
>  };
>  
>  struct dw_pcie_ep_ops {
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index bfe873cbf44f..b061eaa227b3 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -253,12 +253,14 @@ struct qcom_pcie_ops {
>    * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache
>    * snooping
>    * @firmware_managed: Set if the Root Complex is firmware managed
> +  * @link_retain: Set if controller supports retaining link from bootloader
>    */
>  struct qcom_pcie_cfg {
>  	const struct qcom_pcie_ops *ops;
>  	bool override_no_snoop;
>  	bool firmware_managed;
>  	bool no_l0s;
> +	bool link_retain;
>  };
>  
>  struct qcom_pcie_perst {
> @@ -960,6 +962,42 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	return 0;
>  }
>  
> +/*
> + * Determine whether the link established by the bootloader can be reused.
> + *
> + * Reuse the existing link only if its current speed and lane count match
> + * the max-link-speed and num-lanes specified in Device Tree; otherwise,
> + * retrain the link.
> + */
> +static bool qcom_pcie_check_link_retain(struct qcom_pcie *pcie)
> +{
> +	u32 cap, speed, val, ltssm, width;
> +	struct dw_pcie *pci = pcie->pci;
> +	u8 offset;
> +
> +	val = readl(pcie->parf + PARF_LTSSM);
> +	ltssm = val & 0x1f;
> +	if ((val & LTSSM_EN) &&
> +	    (ltssm == DW_PCIE_LTSSM_L0 || ltssm == DW_PCIE_LTSSM_L1_IDLE)) {
> +		qcom_pcie_configure_dbi_atu_base(pcie);
> +
> +		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +		cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> +		speed = FIELD_GET(PCI_EXP_LNKCAP_SLS, cap);
> +		width = dw_pcie_link_get_max_link_width(pci);
> +
> +		if (pci->max_link_speed > 0 && speed > pci->max_link_speed)

I think I raised this concern already, but this goes against what
max-link-speed is supposed to do, i.e. this will not retrain the link if
the bootloader had initialized the link to a speed faster than what the
DT requested

> +			return false;
> +
> +		if (pci->num_lanes > 0 && width > pci->num_lanes)
> +			return false;

Similarly, this should be ==

Konrad

