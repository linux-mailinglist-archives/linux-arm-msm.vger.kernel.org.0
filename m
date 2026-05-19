Return-Path: <linux-arm-msm+bounces-108478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DxzFrxJDGrjdQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:30:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B157DA1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2B7F3012C6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE0133A9C4;
	Tue, 19 May 2026 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIfAg4ZC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZFffMB/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D1735CBCB
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189924; cv=none; b=AfqLeqnxWOS9J9f/m2I7llQYxVaXIWDvJiyuB3ejYrGVGKg6+YgRFr3i9UH1K5wgTk+sBvVsOEaQ4BfbXE89vHrAfmm1ZGnCJ9ztSCqBaaIN++TGq/vVL7XrcF+EHFZaf4SJpVHAteaxX6YZM+2/RiKg6foCBTb1YLFhKCqKPCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189924; c=relaxed/simple;
	bh=DdlYAH7YYC/uFEG6PShPTwU3kyoumx8Dw/obSoed2pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEVhj39jRFONT6i6yVjek4rPpfqol/kluYAlyOGrt9/660quVJH17NPZUGmYjVMpzr0K+k1S5idJyLqZjOxV4Zees96G7z1YJHvbI4HGLV1Km/GDR8LOhCEiGgXUjPREO3WileSloI9eQxl2tKjJDYH2rPd12i+m5L4YxCILJ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIfAg4ZC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZFffMB/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JA100I254218
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avHDZ/dhsbqUN2QfuautlreNoMotY+jG0kwbtZGQxPY=; b=QIfAg4ZCaWfbcV68
	Y89gr/Y80ttsyMuKvNpnNp0gB5vV+wla1PSODH/FEwCHlLUpPslTMBYmbgL7F3Vi
	c9y7uhnQN6jeUONiABBP8H0Ip9w6MrKirrCY0LKMkjnuO0JjKcusvjcnZFQNfY2M
	x+zaEQDitQTahSCzeVoSteZeQbHj1/CTRTmXLvJW6ui8y7mkpZbrv0xLPACS5CEl
	2xG6cK0/JshtSTBCPjGMwBa+rTVep3HTkFsHUb/sug5QiV5QJgbKRpRajYdtwQjw
	5nu0nsaUdxBY62ymVH6Uxmm1TxNri8SQAmrNNluihOlIdsjTy4/mZH+dn6tDpRtX
	5cUHmQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87sm8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:25:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f1b94ac9dso15794471cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189920; x=1779794720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=avHDZ/dhsbqUN2QfuautlreNoMotY+jG0kwbtZGQxPY=;
        b=SZFffMB/7m8SKieBZaHqeZ4wn4rxldBOX76LODD6DV6HbFFa92DEzO8X+jqnnI/DRu
         hQazO4T5VKXjeG/OuLRDAh3MBvU6HMZwYPsChBX4gIuukO84ZJYs5fv+I503pDe8Pa88
         KsZHNvJSsHtD3dUwc4mf9LoAYRJP8EoabXDxBuDf0ZYjhHdjMlXX67HeKcpB+rPQZ2gG
         vcFNyF/QZ9zRK4xzfJaQY88PZAzFl9lWx/qzyBSiWbUVUNXKjb8/aR7g/uXRKZLyT5sH
         a234gMMQEuBtZb2cmAMJnprcdCu4YeEvGp2VqbGZS/WXcoIEYbwdgQYmHEOQtQJfBsXR
         Y8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189920; x=1779794720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avHDZ/dhsbqUN2QfuautlreNoMotY+jG0kwbtZGQxPY=;
        b=IOY8womDAZyxP5TWafKUnc0TbxX32kAE0/boktsljSMAJzr4Rzx4xie7rkP/auUW/W
         xloK9RbzY+4/+TGJbOZkoXLmGTOXJ3nDdDoS98bRaaXjRbuVVI1lb8rwJVmpLPLRDuKG
         9uZ5S9tAfPwbU0EICgKC4m9LM/JRp0keCn5SQsN6qLnNyzns9G9X5mCIKo0b/6IbOXR0
         yWJe2HqBxupldFKC0U3ozTA2DPzLBz24MkoMqabT+pj+bCO6QTfSuz9G9nl1apri+j5/
         6H7d+ETq9GZ2chTZ/Im3TubirrxY7e0w3Gi5ahjhr5F5wepkUIiexMx3pX66fn+Xhfif
         Gypg==
X-Gm-Message-State: AOJu0YzhL+HeoEsCG0gWg1ZbViOXJLgLL97SwgqB2KS+F+Q8ZY5nQeuE
	UMDBYoZ6Dc7TwLHxMFsMcERBItDYLoG8yUyNVzHjltB5TJLpjM3mdqafI7PN15ankwg+9jH/I4r
	UaOe3svnngHxncukjxGxu21iMs7J2ddHc0v8bhkMCKVuJgxv2iDxD+mLX8+//IIaa4eX4
X-Gm-Gg: Acq92OHlo4VvOl4V8fpPRtNTkUH6bdovcK+cVtL6JTeWzOBJnjUgT+/zI2jbkz1HxTW
	5ztrCZvTe3LqMBcXjBejhRDbTF5PCA3wJ+eUkwNTs1Km7N264JFjkkhB829qx4wkXdx+g+h5Ypq
	O8G8Mdk5OzvwzlV/7nHPkslfyzqNHGXKYq1jm5ZgpBAR36nDKLMeSCQf3jpAGDzrviBCogJCzsu
	4vS3j7v77aPVa5G/wiF0yztMbhGlzafsedFhkdGwFaUFl5ZiShht2FoNKZImq4thzb8bdlGHJqG
	nBfoa8snJ685qKH8t1tKGr1OREoIj5apc7tzyU8/JJFiFsBPIublF+SUPw23Jey3JNTEv4cJxxa
	wZKVYrfgbb7lVQ4EPI/+pj3XtS9PClbEV2fLKD2Kn+A0M6xP9MhvyAMjp3jiFzE6j5MPbOXgh7S
	xRTOE=
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr197475281cf.8.1779189919912;
        Tue, 19 May 2026 04:25:19 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr197474941cf.8.1779189919482;
        Tue, 19 May 2026 04:25:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e21235sm687291866b.43.2026.05.19.04.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:25:18 -0700 (PDT)
Message-ID: <dd74004a-cf60-47be-9799-8b658830af8f@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:25:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] usb: typec: tcpm: qcom: prefer VBUS supply from the
 connector node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: I-H0DIUOim3YGygp-GvFDnTPIca5jXU0
X-Proofpoint-ORIG-GUID: I-H0DIUOim3YGygp-GvFDnTPIca5jXU0
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c48a0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=K9uqyr9RctTKKMavoioA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfX/2OtzokV19Ub
 XlDw/ehwjaN4fbXFiUGLRHU69Y9WxYrFLsmN58loLgq1usIq4Ng5/HTQdKnNHKSvGCUYEDABzlW
 /outqbChIWqQ87Lv0yRHkKUbsiAL9RJXcBNiXs1PQDn844CsCZ6fFoRE0nj4uYNT3m+e5WPK1z9
 d0ZPvszmQSCx/ra5BtWHFHBxX1FZpea3eCriZ/cxgyr+r5cmXSdkdGmz+DG2Qf/E5wRyA9+rvO5
 LPFfZrF0u67+ciJV3ga2/cP+bD2XsEVtGy059JFjG4y+TYFBhrl+d0oED+P9DSBwA4rckKXDsB3
 LsZIe71t6J9OqBgFUxQPxAGGGCNsD4qtaB2KLoA00FBqW/s4b6feqxfxh0mFLDVE+Mi+zd42RUi
 iv/UnIgltwFTuzRcMLPm3mBcaueCWqFPPf5mzpEP8VjLucRja6+H6jp00WGQcf6n8VAs6Y0eWrf
 i4kSGKzaLWcIco4OgOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108478-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: AF6B157DA1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> Current way of specifying VBUS supply (via the device's vdd-vbus-supply
> property) is not ideal. In the end, VBUS is supplied to the USB-C
> connector rather than the Type-C block in the PMIC. Follow the standard
> way of specifying it (via the connector node) and fallback to the old
> property if there is no vbus-supply in the connector node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 8051eaa46991..429bd42a0e62 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -9,6 +9,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> @@ -704,6 +705,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct pmic_typec_port_irq_data *irq_data;
>  	struct pmic_typec_port *pmic_typec_port;
> +	struct fwnode_handle *connector;
>  	int i, ret, irq;
>  
>  	pmic_typec_port = devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KERNEL);
> @@ -720,7 +722,15 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  
>  	mutex_init(&pmic_typec_port->vbus_lock);
>  
> -	pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
> +	connector = device_get_named_child_node(dev, "connector");
> +	if (!connector)
> +		return -EINVAL;
> +
> +	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
> +								   to_of_node(connector),
> +								   "vbus");
> +	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
> +		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");

One could decipher this by reading the code, but please leave a comment
hinting why this is a thing

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

