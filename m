Return-Path: <linux-arm-msm+bounces-107800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOQDG8f9BmoeqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:04:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF354E016
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A503B318B13F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23918466B7B;
	Fri, 15 May 2026 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuoHn+1N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bwv1lmKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3251478E56
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842090; cv=none; b=FB1kKXq1ix/7sH654uI5blRvhk8U40qACJvNFH8Iy4TirUgTqK+EmA57OUdriVKwlry+C6itcEfGSDCaWpV58HcBimrcDjExu91BQQpxs5L52MTxJWXYrKgmM2u/iro3uP740QQrOryFh0kpnaQTSBA/t1hhlg4vxnVnPtQPU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842090; c=relaxed/simple;
	bh=yWUkKCxpknhAXq/88uPPyHdo4U2bnW26ExLNI4eK6vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XlVzfAwHmKNPRX+CEoxRATI/BLXGXpGJGphikcso7reA3XnsEqpl7ml0XFM8Xox4kdsdEOF7+DFAybZVOjPl8bdEAnFD12/qXlKBK6B30y/ml5enOf3SEW413iyQTxvRrwOR15arXklHL1/Kl3uE9oKITvuUMkusFxyqWeLC3MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuoHn+1N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bwv1lmKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4r0NF3200106
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mWXgiQlzWpIuNL3PuoPS509A8qqN1Lj48ZNShMaqLiI=; b=UuoHn+1NOgriSVno
	EEcDXEWwwXDApCs+f26l9CFuUbzJIH+6RKA/PaS9v9vRcW7+NUYCptNtuosSd9D1
	IdJ1HVvt3z8uywDWJl7BA/UE0UPJgMYPU/Y7D/A8NVSTR7cq67HqvVDXwX8tILKu
	0ga0Zbx1nESMZfP/HrruNi+D2Wf8ptZ5rgmR84ZTnzI1WhdKgPzm8oqwSOUAyTO4
	Mjnw4D08G1BB70nnH61YQAC8LGi4kb/3b0fy0U5kEv6UTDYaq5KWPMA1qvoaMt6c
	a9AVVEISilLOhvWnHrHC7ZUbVnd35pBL9rXqV8Z1G1e6Nf6vu/FFKgj3ejSPHCzw
	LZjI9A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtuu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:48:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bce224720d8so5135917a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842088; x=1779446888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWXgiQlzWpIuNL3PuoPS509A8qqN1Lj48ZNShMaqLiI=;
        b=Bwv1lmKsnI7/nJ651YeCDKo1fq2hasPP9buHMVCc5gQmew6M7gFY73WeNqSfQcF2m5
         TgSJix8mJvJ+PSjn48FLc0QyIenc3jQdEcnW+py5RUBr5CwcLPA7rqbyk//2vIGmfC9w
         f49vUetIGaiYNF47zLde2e4pxPZt9Accwb0fSKrTMHgyo9sm5Yr5GV8XyoELERcVf1a3
         gNVP9GpEiaZgIe8fPzn45aP7kbj1o8InBUV0aixh4ZrO0BCJ1Az0Bjm2LqzT1R7CKoJ8
         A3TfG88XRgX9AM6EUyRvgF6UJE4SlaO4bGyVqaLdW1LueadwkGIiLlrKycoiwIXWyeA/
         6DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842088; x=1779446888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mWXgiQlzWpIuNL3PuoPS509A8qqN1Lj48ZNShMaqLiI=;
        b=K/hiQTaqX1jpoOfAlTb70Lnd/PcwVaIBXvoGvBL3PkAMs3TbdwjAF7hhSgkiCbwMZX
         pyXfcW2IFAds2T3B08nyWLEweunvPTdP+3MoPomFQCwIvBVUy4Cc76SwNdkDraknn129
         LwDqhLMhJtw8Ha8ibdCZqXCbNxJcxlB5qVRp3CsFCXNgSDO/IH2iZonJSp2XYJYxwXJn
         YpwkQwxkydB2mdzu/48VPmAQL/yyKhIGosOC33hHPZXcYEQoIDjD1MWbHotIhFWi22sw
         BASAaZv9ieYHr31YBabc5U1PywoVVKF5Gk2MwQ1Uyx9HVkSfQLhV/yOmtBIaLPJnCoEx
         GhyQ==
X-Gm-Message-State: AOJu0YxOiIB9pI+NBuuMY2b1PqBQjkxzYnhfibugrV8VzfhFkBAGJYGm
	P73F6dAi/xN+ueYUT5T64znBb5tUOyRgG31QR7UR6tsWJvrT8czZnVO5Bpw6yGeSSJ7eyuq3GXB
	VZ+nrKk3MSOAWQbBEIwrbzRSiYQ3oq7/qHdhyH3GgdXgK9Z4G8WDREJegEHY8Rnj8dnsY
X-Gm-Gg: Acq92OFG4mimsVOYyNlaXoawgyOb4IsY3XB7WRbK6TOkGQKRC5iVLrb22RO44MBjRDK
	77kem6F4Re6CR1QVdL4nsCXxVe98wOrmSiPhYOAg4WJa/rhMMu2LBcj1rkH+oTQgHV+ZmcsW2Pl
	ig4h1FfLkQTlwtfqOtlSHFxKPIn2uKrlhwWCp+iCPwpeQlZ0tdIxgcRuGgOAVniCiGWGdJ9zSnW
	fDVGnj0qj7F5Tc7ufHwQ5rx4PSIjPSMOMlnU0s/vMJCfp2BeRYSwO3uvfoztBXTx9sgrRfKxlW1
	8ut68XIYUV4qIiJGfDg+l1FfLwPmV1JhMiShPRmk8COHGto+vev2EciTiwjzafJRDMIYZhqb1Hu
	TkvnYPAPpmZJi0eyBCEE8DBZ1s45RT0g75pvPQPWRxG6Ic9JaBRc3appW8T/N/wvvOFyHmYKXLA
	xdIRlcSraRo49rx5iDPyPj+UTH4H/bYrswXk59Ya7PbzDlKDMs7Aw=
X-Received: by 2002:a05:6a20:4305:b0:398:962e:83d7 with SMTP id adf61e73a8af0-3b22ee7df4cmr3917207637.43.1778842088328;
        Fri, 15 May 2026 03:48:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:4305:b0:398:962e:83d7 with SMTP id adf61e73a8af0-3b22ee7df4cmr3917170637.43.1778842087839;
        Fri, 15 May 2026 03:48:07 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:48:07 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:45 +0530
Subject: [PATCH 4/5] phy: qcom: qmp: Enable ipq5210 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-4-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06f9e9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=--c7UDEKweIPGI6wXLMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Q3JAy_DKScUCRifA4WDRwgywI5vCBx3x
X-Proofpoint-ORIG-GUID: Q3JAy_DKScUCRifA4WDRwgywI5vCBx3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX/HTYdVaCYqBz
 uKb/9PthFPpfC37YUpF1INz8lJQ0RGY5sB9L7dDtK5Mcz1YGjkR/qBmPPRNjjnXGVhx0y9ho2yc
 2ekk45v07fwM4/biZdccrb6eoammip+AHNSNchWj3Vl/A3u9B5itFUTe9OTLHO7BXHQhLB2Ky7b
 LS2pb9sHpln33yHWdQpWluSH5E7O/HRGEWcJNZPmYMoTzUF0d1P4IW8OQeJg6WIvrgzIoHJXC7r
 VwI73XVsr9dGaUpRb7q7vFoF8JT7lJ0XRJxkeGEZeiJJn4Uqp8tMcVtklpftKuHzPPUMtx5Ks9v
 WjrFT9ZrE7x1l7+brOix/S/JC00oZTceEfzUTnrikvyXj0zd2ni6LJookvvlvqCZ+MZoHVbWQZW
 /+5GlKzR6NZygmeIKW10sRubYh4z99VsDvDHa4OuL2wMqNBk4qXdHOqpCLAEm+bF/EnnpXfgTkc
 5WeD3zNg1WaOzxihcZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: 10AF354E016
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107800-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable QMP USB3 phy support for ipq5210 SoC.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index b0ecd5ba2464..8d3d7e39697e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2449,6 +2449,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	{
 		.compatible = "qcom,glymur-qmp-usb3-uni-phy",
 		.data = &glymur_usb3_uniphy_cfg,
+	}, {
+		.compatible = "qcom,ipq5210-qmp-usb3-phy",
+		.data = &ipq9574_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,ipq5424-qmp-usb3-phy",
 		.data = &ipq9574_usb3phy_cfg,

-- 
2.34.1


