Return-Path: <linux-arm-msm+bounces-93048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEfRLXkMlGn4/QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:36:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5B2148FF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B987300E722
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 06:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEF228C5B1;
	Tue, 17 Feb 2026 06:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3cT6AhF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNUydEml"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA132749EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 06:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310176; cv=none; b=Oc+ZMIGH9J5415ONlhU85XnuCet7KBD2FDF+Od4/FiIxdIWsnvwfZLNbv78/VlqIuuZqNCdWCsvW+2d5jxBtPHGGjShNr1Vs6MMO3KbtWQ+0z+x6+tEsqvUXzUCBGcOVg9XqlvuXFEebDmw7iSGwuPEE/+V4oT3BOXXsSh2IeMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310176; c=relaxed/simple;
	bh=scImbhq9CBmxyP+rIejIb3Uc+jNFpVsSyEdbGqgm2qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsYTaLEbAP3HVvbr9wf7HeC+tS5yBi5y2Dc24SeP+0Ro8aB2AnsKnDTO+Ya5jjzucH0xaYglNk6GHq7TRRxN/UlL6SJDElxyk4XKTZvwudFeD1wWciTppqvG/jmfsMajN394GRrhRBjONpSFMAVpxGXGtVLUrvyIeRW9E1Q91Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3cT6AhF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNUydEml; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H3eNdh2108540
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 06:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C0z+ZHCDQpvcslXmWkDoLTPK
	gKfxRG4MGWszpvILlXY=; b=M3cT6AhFx5w0/sTo9lhN32p/xvORPOm8lvcU1pKJ
	pvxcHHd9EXg6+q5SVY0htPy+leQwPmH3I01ct6PJxAXfq0sVfZgC7zOU6BEi7qGe
	orfTEH9SbJCNatqMye60wcgEYtN1ZqBsSugA5YKJmxRhm4Qo9qGiMd362hkS1nSj
	l/p1EpnRyyBfqd4AwmzPMhy0IIEiUFZWNNebVS9FF3Z8a+wNFCUV5b2efrLkXX5S
	Ev7tFR4VKq6llwbgD4bkT2xKq+Bkw4rLnwwBK+KxZpKhWkRZcehuPdXyH0M3gpgv
	xEgAc0wDGHXb/joOXLmXeURv7PQg8B7eddzaqa1UBCqzpw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9khe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 06:36:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8947c4398c4so334973886d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 22:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771310174; x=1771914974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C0z+ZHCDQpvcslXmWkDoLTPKgKfxRG4MGWszpvILlXY=;
        b=gNUydEmlY1NRvEZPFQRmW5bvrzc5RiF3wvfCKzZYVU4wf6Buw7cBrO1hN2VHrbLn5a
         GGqu1puNCGROce78Bk6y+LcNtXo/CneNqfQdwPFORkbzL1wuV1hirI1IhgNl5so8c3Ym
         OAnrnBL6CYNxRjlYe5f0ejQm0vzrudp3G1x5Cqydh11P5I+mq/MnyXeIW694pnHbSzM7
         Y36si/u430aK+aYY/vUtemlbK5LQTCTGIWcAKRiCMyxyC6U/4EmE5rEy9A+Lc+Me2G9F
         /rQH2Atf/3getUrHjjJi1FP65ZIVtTKGMh9Pxsf5/TO5qHgbihFFw3PdCULuooDklVCQ
         998Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771310174; x=1771914974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0z+ZHCDQpvcslXmWkDoLTPKgKfxRG4MGWszpvILlXY=;
        b=cEkmvXhT0hrlrv0pRI1QXxXSFHHyLvoNV8zIzfdyvVifZekfIhSD5wLtH4lBNZirem
         ywCcmXxw/sQt7H2wBuyquGiVJfWMMTo9YGBVi/HW8S+VKv9ecTiSa8dUt8sNelZDp2oA
         8UaTgdTewDNVAlPHCy5FRJxAgx+x9Cg4vrB4Zp8g8obKbTVsjTZE7QtSU0T8l/SuDAaD
         MjapsieDAav/lINYFDTaSnYVYLltS7tuGsrYRRr4Q8EM0jaraBLPu4wPvuH/ss/MO3w/
         oq5/BZDL0Xy+JMluwTcB8XXFGygmw2LgFR2gz35lpzbh+OukmXfTD0xPpr12T8xA7Ykd
         y5iA==
X-Forwarded-Encrypted: i=1; AJvYcCVSduaKzvhLsALE7xkGJ4WCy4eMTzg8X8vBJK6uK5pmlZpLSJ2r29bHKe8PbPCjrf8miHtxi8iRgDhHsleJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyyQk+O0nUNFO3oVWB/e2FSqo+KJXCJGxbm/YFe4UuhSSODJdQw
	UEQ6hmAosBscQ1OX1xUcgJTdGv27kU3o/geTNtqi07qDZhGfN0UJLpqBK4gKTYjzX6iXGUNBVbY
	hzIbf98ezTf1vRotzQ0cZr1LoyuZYcIpUtbQkxLo4hw1CNKmhEBS98WKN3gp+pvhCSRWl
X-Gm-Gg: AZuq6aIN8B0xUBaip+ti6YELrfOZJ2r7lkxt4dWN/PLlwXiKQ0DnzxIqnjVTPZzo87X
	sM5gY+uWAZl6wryq7481w+Pb2i+fjfjr3XLf36n/7NlL93m665xgjCxaX4r2hPW1FeG6/PI+hVN
	XhKG2SgKqJGx4BVuN/KRmVxIPJg9sP/pUh8kcgtvvvesY2gN/6AL7FVqOLDPvAtsF9V8rUG+omH
	cvUHWcdjBMX21uR+bwgcOjp0NdNFShxGWiRPS2WqjpeQVdhc9C7B17qnmVMTijBirVVpH04yX8l
	vLTsD8dqCIKFuXyo9064u49sJDjep5u1/XO/5+ts1Hc/Vxq0wTRblhVIXnkJbkvJvT+HD+aLajo
	99p+l7gJAeKfsswagSyxIBcBdvmWSYB9WtkQajSWj5+8nJcdOuM0vvLzWZ4lJ/fIKTXKWKdNbPM
	kdmFKjfc1Zju3mv7hnsHmQu6a31h0E8ZnrS+M=
X-Received: by 2002:a05:620a:4689:b0:8cb:4dc4:61d3 with SMTP id af79cd13be357-8cb4dc46c23mr1041157385a.45.1771310173456;
        Mon, 16 Feb 2026 22:36:13 -0800 (PST)
X-Received: by 2002:a05:620a:4689:b0:8cb:4dc4:61d3 with SMTP id af79cd13be357-8cb4dc46c23mr1041155685a.45.1771310172920;
        Mon, 16 Feb 2026 22:36:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56b590sm3656994e87.34.2026.02.16.22.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:36:12 -0800 (PST)
Date: Tue, 17 Feb 2026 08:36:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, janaki.thota@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] Bluetooth: qca: add QCC2072 support
Message-ID: <mt4vrzmq7caqddwtz7nc3tn33zxh7uupoxfmk5pfqobhuex43f@se64qz7qvuh6>
References: <20260217054731.3058567-1-vivek.sahu@oss.qualcomm.com>
 <20260217054731.3058567-3-vivek.sahu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217054731.3058567-3-vivek.sahu@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dwHqQJiC8_Rsz0ceNbcRiiF0JZceWa54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA1MyBTYWx0ZWRfX9V0iwSoiTv7Y
 WKJ3RyKOoxpZZu94duaNHU8kz53R384yfAvAr/witk+QixSL2Fz6akH+6GQyp8BlYqApld67RM5
 YUjAhdOXQAWOiu05/wh6sKQueVMkLvJXuvu5eDdZgr0wApbuAFuH/0qcVCoYyTzN9yHK/VMpK48
 eHP1Zb4tEvjuTc3fH3Pg38PCeVUd43u+tZ0/rTyUO4GnRgx3jaqcHBCJCtQ+V8nhEWkH9cmTZhX
 NuNtWsJ9ReqefrrrfbkUvv9x58aT7V4umUnEW4ho7Dbv5gN7ss9yx1FSQOSNqL9Zn71QvaMvEfI
 quEuWjQok3FcQYxFhJZFGmlxKQ3Nvrki0rtYOdmCdNbA1YQsUOpXZCtbMStFSErAmvqBo/fcuVD
 d4z1pq7dfGWkpSJ69u0vVPXrHCDPbO7r2Dc7/L1fhMN5VsjMLcYaVkPZu/peYJn75qNapGGNLnP
 EKlxEEHOpGN0X5capqQ==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=69940c5e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=qTpL0HBMRkf-sisulhkA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: dwHqQJiC8_Rsz0ceNbcRiiF0JZceWa54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93048-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C5B2148FF7
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:17:31AM +0530, Vivek Sahu wrote:
> QCC2072 is a family of WiFi/BT connectivity chip.
> It requires different firmware files and has different
> configurations , so add it as a separate SoC type.
> 
> The firmware for these chips has been recently added to the
> linux-firmware repository and will be a part of the upcoming
> release.
> 
> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c   |  8 ++++++++
>  drivers/bluetooth/btqca.h   |  1 +
>  drivers/bluetooth/hci_qca.c | 18 ++++++++++++++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 9f7e13fcb20e..65c8d2978956 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -807,6 +807,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/htbtfw%02x.tlv", rom_ver);
>  			break;
> +		case QCA_QCC2072:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/ornbtfw%02x.tlv", rom_ver);
> +			break;
>  		case QCA_WCN3950:
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/cmbtfw%02x.tlv", rom_ver);
> @@ -900,6 +904,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/htnv%02x.bin", rom_ver);
>  			break;
> +		case QCA_QCC2072:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/ornnv%02x.bin", rom_ver);
> +			break;
>  		case QCA_WCN3950:
>  			if (le32_to_cpu(ver.soc_id) == QCA_WCN3950_SOC_ID_T)
>  				variant = "t";
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index 8f3c1b1c77b3..a175ac31e7b2 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -158,6 +158,7 @@ enum qca_btsoc_type {
>  	QCA_WCN6750,
>  	QCA_WCN6855,
>  	QCA_WCN7850,
> +	QCA_QCC2072,

Why not keep it sorted?

>  };
>  
>  #if IS_ENABLED(CONFIG_BT_QCA)
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 8e035b7c6f3e..7786ced0bbbb 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -625,6 +625,7 @@ static int qca_open(struct hci_uart *hu)
>  		qcadev = serdev_device_get_drvdata(hu->serdev);
>  
>  		switch (qcadev->btsoc_type) {
> +		case QCA_QCC2072:
>  		case QCA_WCN3950:
>  		case QCA_WCN3988:
>  		case QCA_WCN3990:
> @@ -1500,6 +1501,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>  		 * changing the baudrate of chip and host.
>  		 */
>  		switch (soc_type) {
> +		case QCA_QCC2072:
>  		case QCA_WCN3950:
>  		case QCA_WCN3988:
>  		case QCA_WCN3990:
> @@ -1516,6 +1518,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>  		}
>  
>  		switch (soc_type) {
> +		case QCA_QCC2072:
>  		case QCA_WCN3990:
>  			reinit_completion(&qca->drop_ev_comp);
>  			set_bit(QCA_DROP_VENDOR_EVENT, &qca->flags);
> @@ -1535,6 +1538,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>  
>  error:
>  		switch (soc_type) {
> +		case QCA_QCC2072:
>  		case QCA_WCN3950:
>  		case QCA_WCN3988:
>  		case QCA_WCN3990:
> @@ -1551,6 +1555,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
>  		}
>  
>  		switch (soc_type) {
> +		case QCA_QCC2072:
>  		case QCA_WCN3990:
>  			/* Wait for the controller to send the vendor event
>  			 * for the baudrate change command.
> @@ -1935,6 +1940,10 @@ static int qca_setup(struct hci_uart *hu)
>  		soc_name = "qca2066";
>  		break;
>  
> +	case QCA_QCC2072:
> +		soc_name = "qcc2072";
> +		break;
> +
>  	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
> @@ -1970,6 +1979,7 @@ static int qca_setup(struct hci_uart *hu)
>  	clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>  
>  	switch (soc_type) {
> +	case QCA_QCC2072:
>  	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
> @@ -2003,6 +2013,7 @@ static int qca_setup(struct hci_uart *hu)
>  	}
>  
>  	switch (soc_type) {
> +	case QCA_QCC2072:
>  	case QCA_WCN3950:
>  	case QCA_WCN3988:
>  	case QCA_WCN3990:
> @@ -2108,6 +2119,12 @@ static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
>  	.num_vregs = 0,
>  };
>  
> +static const struct qca_device_data qca_soc_data_qcc2072 __maybe_unused = {
> +	.soc_type = QCA_QCC2072,
> +	.num_vregs = 0,
> +	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,

No regulators? How is it powered on?

> +};
> +
>  static const struct qca_device_data qca_soc_data_wcn3950 __maybe_unused = {
>  	.soc_type = QCA_WCN3950,
>  	.vregs = (struct qca_vreg []) {
> @@ -2758,6 +2775,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
>  	{ .compatible = "qcom,qca6174-bt" },
>  	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
>  	{ .compatible = "qcom,qca9377-bt" },
> +	{ .compatible = "qcom,qcc2072-bt", .data = &qca_soc_data_qcc2072},
>  	{ .compatible = "qcom,wcn3950-bt", .data = &qca_soc_data_wcn3950},
>  	{ .compatible = "qcom,wcn3988-bt", .data = &qca_soc_data_wcn3988},
>  	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

