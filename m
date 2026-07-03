Return-Path: <linux-arm-msm+bounces-116428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dbfVCKdGSGrCoQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:32:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED4C7061CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:32:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ByB6X4sj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BKyGoFNg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116428-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116428-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F22F3049E20
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 23:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C4A3446C5;
	Fri,  3 Jul 2026 23:32:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BE2288C30
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 23:32:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783121561; cv=none; b=trdqOdXOM/nPOmoBgUdHhdW9wCSW+PkHV5J+2dm1yfSHlinGfgh1703/94tFnyAPYEsJxXSXOL2BatHbDXt81cEk8vRzuyZhdhY3LK3K9i1pfFyCphjSsCPWzQzMyDENyI3f7eVODTAyqme51E47hOFlOyBMwQ8KdUcnqX8zYFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783121561; c=relaxed/simple;
	bh=wuESj9b85l1vW8rE4jIgNP5KS9UrLnHyyKAbSfhB5js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VE1vm6RUGGNoHR3PUVHZU40SxQXJgI1spyN7Kg+ZKhsl2Pm+v6/yyF6YmiH2qqDSRWHARhoNeZ3FrC0bJawFWPlspMmC/3riDYB5UBCz3G58BUO18rj5gB7D6U6V3PpdQH78vo3X4Ty4y93ou+e8zz9wmyRR1T3Ob+bW2p6uyQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByB6X4sj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKyGoFNg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPjRw1031220
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 23:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rCUR0wz38uCbldyWNaolcJvt
	e3Z+vL8gly+V3QJ2IU0=; b=ByB6X4sj1Aby7ZzUMNL/uU4Si6hzDCv/8oNQU/Yx
	WTYmdMdZqzPL2s8EdHrfnar1dNAUCGNlGHhG2vNSyHSnaNSxoNgQhQ05HU9Kifc2
	MQwi3MKD+6WVhX1yLTsXBLuI6D6cKtgGEJQF7eX26xgpmeDGwK//0hgrOxOZUBAA
	lmSIcaTUjUnJZGsunoBzM/XDf9Pa+ojs7mIIOql7Hl6uUkghsagqsDq+i1HU2Pse
	4sUREjrslbD6eebEXiw9/NzWaq382vJlAKP5QkM4UwFAw+8LBPdpl9/qNVP0xp6P
	3SzeaBV7CUzDd/KqpaLHdi3DArwFShTe14B2+HaXGwE25A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5c7wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 23:32:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f000e221d7so8679636d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 16:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783121556; x=1783726356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rCUR0wz38uCbldyWNaolcJvte3Z+vL8gly+V3QJ2IU0=;
        b=BKyGoFNggRYlfNeH/15yKRSWXD/m4saLNLPh5orcws2itq/C5FIU6ICG2rvhyJmJfb
         xjLAVEiQRmNW3wmHg6K1c2SuOqmQ8l66mvjXdn1dtbc1MJ3PfmMyFu7O9OVw5TZVj9SU
         j+s16UhfvTW/kjb37ih9+jANDje2uWLk6ynKgMoYXepQcnY7eM1zzrUTBkbxHbWDgmX2
         v2koLVX7Wv0eRAg6onhe0qtrztmXrq3eZVSPHpfPK111GweuyMS/R/mdfZGKWTfO1jT5
         sz44HJHPPEkMoAcgcmxXWvfvmxDhNOtFmef7fG6WhBxA3HXLilogIJ+Vhsw7bXjbvlw0
         BtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783121556; x=1783726356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCUR0wz38uCbldyWNaolcJvte3Z+vL8gly+V3QJ2IU0=;
        b=b+YJenb/3vS0hzcO8ucARCS8Eelzvj5YSCm2jCyMAK3FNCpXn9w6D7PUYbehMegefU
         o2N4VwtWjN3Oex/RW3okXRtGReuUyA8UrVakA/viFhxJ8MvVOyrBUZDzl+ltJq+jBlYj
         M5ARbmzYE1kjqs+1KN8rb5IP6X9gony1Kl6V8ggeOuOGYDXyDZ2BFnQodrE50cmJMPP7
         I+Q1awh/tbx1gVmCgVXSxB8nQ6TlaDt3NDDD/IHzoefTwK6HZJXU4eKLFyEtbvp/bttY
         FjroFgwEJvIRB0qmNkHYwKPM66eJzLrzQNmRn6iRw2hK8F6bfS7N7krgAuD71h5qLrnP
         YTzg==
X-Forwarded-Encrypted: i=1; AHgh+RoH66MGX4w1zzEUEJpgwLgdYNW5O5qAW7uNSdUIpiYDh4dyOOH7hG5ERj6nkbb2AfKm7pBJLXdYHqWKTHle@vger.kernel.org
X-Gm-Message-State: AOJu0YzeqHzAZolYhloG1MyppLyLRkLlA/5YqBgspBqo9uKlho9Cucpp
	GDqSDsTvbu0jQhyUkKOJj4ZO7gXwrcsH17OKk7TcYV3BhKx0eAgVdM/4ZePj40KaZHSVK/xI1HT
	YR4vrLB6JM1zj+sK6E0xWXwwhetSSpBkVTEMMnlQPgjsfOOLaQ6T7tW2RSNnhulUkApTI
X-Gm-Gg: AfdE7ckcpIjJlQRaff6pbQa7dcE2zYIYzzLu8UZnqSq2ZPXqvur+yBFQmANivTS5Nwz
	V/Tn+2qGypugolIgq1rM2B0ER85Of//PBuFj3BjQXWwBJUVRijl8OCFQYf9xHSWEMqLXvh2HLO7
	YNfXX0+07mlijSWt3HPcASIm27NczW6bjhU0cfI42dxg6Tb/ttKuU0KlB9jIFFgwuiMgxgUoQN7
	rkYdcXrLZaLmPQowB4MgIDfBxF2RrWCYtiymGwU5ZKBQgiiIcptQvW1C5P9/SIo1EMOq6aRRZx2
	p/KpbKhIShyTLb3Oq5uveOeREN5yWSQb7KJljerkyI1RDVDZJXcRqTAsyi42pAuL+lQ3XdyHE2z
	8iN2PT98zo9OcLb+fqCA5T/EQQpbejFPgYyjC1ruZbdoE+ItzS2/O1Rapjv5b76/kY285fZNCC8
	xK2jZKmEmbKfK7+D9MJ43GEXLu
X-Received: by 2002:a05:6214:3d9e:b0:8e9:f62b:8f90 with SMTP id 6a1803df08f44-8f74ccaf291mr18725866d6.54.1783121556505;
        Fri, 03 Jul 2026 16:32:36 -0700 (PDT)
X-Received: by 2002:a05:6214:3d9e:b0:8e9:f62b:8f90 with SMTP id 6a1803df08f44-8f74ccaf291mr18725536d6.54.1783121556087;
        Fri, 03 Jul 2026 16:32:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3be4sm839833e87.73.2026.07.03.16.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:32:33 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:32:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/6] Bluetooth: btqca: Add IPQ5018 support
Message-ID: <hb5njj6m6dsc5ply5mfvagbut45uw6v6pomsrah4g6wuarp6lt@vaarxn4bwnwl>
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-2-62da72818ab3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-ipq5018-bluetooth-v3-2-62da72818ab3@outlook.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzNyBTYWx0ZWRfX+WemK4TjwdG1
 d2ejwClzA+bJSFLcfqQDIA7Jt8eIXZpYBe0hTDOCV4Nds0Lhpp1o/RgAX1IZU3zOOzxufF1FGs8
 WSEfUXpMGYnTkKBBVzQdNQnEIvLd7aU=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a484695 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=o9JC6ioeNWgGuw0WDxEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: z3ubDvcCCT2hB5Sv40YrWKaPrflmUSWe
X-Proofpoint-GUID: z3ubDvcCCT2hB5Sv40YrWKaPrflmUSWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzNyBTYWx0ZWRfXymVZustv2mde
 yzYWP8yOjvHlEhGNlOT9QLc7UaZk8GnK0YSLy3kU961/pWHDqin+/P7egDXIhrqVUfmhYgsUaJs
 y4o2PacBGb7g10WstdYZtj7nKdj/bG2AyLZu0Q95wFMk8dpE7Jzw0KmJ8hd0p+vJjbG1Le8as02
 6EfeP0fvlCTFPK4apOBAI/7rCNxU0TLYHhmLgXZt7jIZ9LGu3dEjaNHMZp0ZiJAQhJYVYarh7BL
 VKzsXYeewVWmX6gdCZImc0fSEvnIrPPiO/IWuFnWBXbeWnedZiWERKnpqCiVGMD8XIRcXBdOkMd
 a84h3om3s4BkQxdCllApRECaRKCAjMd1U5TrMDaYA/9oTW496zqEhm6tLne7p3H6N9tuqwpzQSA
 nk0vi8PPL6f8Ur6Oddb+DbsO2pIU6QAKfcqw6SqKFGz12LDVt3lzaIp11SAl2gMoeGUrS+o1uSK
 kXv3BFDwVr32RpLCn5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030237
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116428-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[outlook.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,pengutronix.de,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8ED4C7061CC

On Fri, Jul 03, 2026 at 09:01:50AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the IPQ5018 SoC type and support for loading its firmware.
> 
> The firmware tested has been taken from GPL sources of various router
> boards. Firmware files needed are:
> - qca/bt_fw_patch.mbn
> - qca/mpnv10.bin
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/bluetooth/btqca.c | 16 ++++++++++++++++
>  drivers/bluetooth/btqca.h |  3 +++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 04ebe290bc78..e136e91976cf 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -380,6 +380,9 @@ static int qca_tlv_check_data(struct hci_dev *hdev,
>  		break;
>  
>  	case TLV_TYPE_NVM:
> +		if (soc_type == QCA_IPQ5018)
> +			break;
> +
>  		if (fw_size < sizeof(struct tlv_type_hdr))
>  			return -EINVAL;
>  
> @@ -794,6 +797,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	else
>  		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
>  
> +	if (soc_type == QCA_IPQ5018)
> +		goto download_nvm;
> +
>  	if (soc_type == QCA_WCN6750)
>  		qca_send_patch_config_cmd(hdev);
>  
> @@ -881,6 +887,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
>  		qca_read_fw_board_id(hdev, &boardid);
>  
> +download_nvm:
>  	/* Download NVM configuration */
>  	config.type = TLV_TYPE_NVM;
>  	if (firmware_name) {
> @@ -939,6 +946,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>  				 "hmtnv", soc_type, ver, rom_ver, boardid);
>  			break;
> +		case QCA_IPQ5018:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/mpnv%02x.bin", rom_ver);
> +			break;

Please keep the switch-cases sorted.

>  		default:
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/nvm_%08x.bin", soc_ver);
> @@ -958,6 +969,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  		return err;
>  	}
>  
> +	if (soc_type == QCA_IPQ5018)
> +		msleep(NVM_READY_DELAY_MS);
> +
>  	switch (soc_type) {
>  	case QCA_QCA2066:
>  	case QCA_QCA6390:
> @@ -965,6 +979,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> +	case QCA_IPQ5018:

Sorted too.

>  		err = qca_disable_soc_logging(hdev);
>  		if (err < 0)
>  			return err;
> @@ -1001,6 +1016,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> +	case QCA_IPQ5018:

Sorted too.

>  		/* get fw build info */
>  		err = qca_read_fw_build_info(hdev);
>  		if (err < 0)
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index 8f3c1b1c77b3..343cd62d1137 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -54,6 +54,8 @@
>  #define QCA_HSP_GF_SOC_ID		0x1200
>  #define QCA_HSP_GF_SOC_MASK		0x0000ff00
>  
> +#define NVM_READY_DELAY_MS		1500
> +
>  enum qca_baudrate {
>  	QCA_BAUDRATE_115200	= 0,
>  	QCA_BAUDRATE_57600,
> @@ -158,6 +160,7 @@ enum qca_btsoc_type {
>  	QCA_WCN6750,
>  	QCA_WCN6855,
>  	QCA_WCN7850,
> +	QCA_IPQ5018,

Sorted too.

>  };
>  
>  #if IS_ENABLED(CONFIG_BT_QCA)
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

