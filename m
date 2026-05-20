Return-Path: <linux-arm-msm+bounces-108741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OPcLdGqDWox1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:36:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE2858DCD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21881301AAB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11F53DCDA7;
	Wed, 20 May 2026 12:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqQtJaJn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxUyttOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4093A381C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280395; cv=none; b=R6/CbZ7hPnlQ5FXGKfzeAepL8EtEbxu3MQKk8IQAmNOQkhD4ciEDe3IIiGEfCnXdm18VhDNm/9jkSE/3RrTqdCH89/qFZSV1jh/w7udZpuS+J2Y9mx4NuaJcvMaFzLpgLX0TwZawUHXkxmtA8VpuY18oaDqqv0+y0ERC8f2W/kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280395; c=relaxed/simple;
	bh=ahaoAoAfsp8czyJswnQ6gTgE2U8diksgFj2UHoFxnLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNPpocHnTCKZgs04wnj5fxorlY7rEEwf7fkUSAp/yxpEy8lfZyqPn9LFPIVXt2cHLH1OULdzKDdDC8nyV7JLtlQHSOkmNAcM/8Gk59HDGvfDAaDle8YEmWMQGkk3WzeLfzrxevFyMaBQ3pqX8NlszazaPWlegDYLJE4cfnMkUEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqQtJaJn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxUyttOu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nWpC446901
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r8+EvyPcMgBzsN6slPXZwJiH
	2h79WpzRBRmrsT4TL4s=; b=RqQtJaJnT1ujdMIRIX3SFAv89d8UOCoHzQsXqPjp
	9XGxMLA6eJRNMGxYhFKcVLiBkLDOs05rGcTJ/3ks166K3ZaRrhVHcRRHBS7fOKtW
	V7U8S1XK2xzYkox97yXX3UKa1JgSX4U2bTbdlq31blgDXYECA7ElCCKLA+HALSGw
	Kgd3UkLHxEiMROYFldhxO+BUgu1Acc0cbchk3WwGjaGzqpHw3sXxrsX3o3kklUjh
	WNLLRwMlozUe0f7hsqPPFsIchMzDM+X8VDZH2eSPL8bDhujQwBv9QFwuSbiGjcs6
	QZPilXCOwvDPFTakn/e+I4H+VUd+8wPOIMfWhIguTCxjbg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrgjwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:33:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63144b84f14so7875005137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280392; x=1779885192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r8+EvyPcMgBzsN6slPXZwJiH2h79WpzRBRmrsT4TL4s=;
        b=IxUyttOuuXhIFZDOfI7mchffebSMBwV15e0F/dc4eLjc8dofgWrUKT/5lEkYoJicSt
         ePK3kK0CHYsZ1VNq7pL/+KM4GZ0sVDKM6Pm7011AR/MK99c5+xaWkRPXV1s7dJh2Y080
         tI/y4q4UXeqQf+omvRYonTxGRGK/XWVqgWAlQ5LzZ8M5MZYur4iyJk/70oCkUmHihdcG
         AhR58eYiuUQFt0djNwDby1aTleEbd+qB8JYtZTYrTuR5ezE2LylDBbQP87hojGait4wr
         JMtxnjOe3fyinj9V5UKiN0u/FBAYJb2fwhuAuhMPE+lVOAeTjaAF2gDY4BEnueZz5Ckw
         8nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280392; x=1779885192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8+EvyPcMgBzsN6slPXZwJiH2h79WpzRBRmrsT4TL4s=;
        b=q36ZsgESeNUFpMf2NGAu7IUaGZdR+KZSxe26QnboOsaWkCsTidBgXU3vCFyTz2km5b
         UMjlBexG8F6qGB/sRwSQkgi5VZxtxu9wOusN+urMvHYP31NCN+tGdP0H+k7LPcX28pQ+
         +lTIWV4+bZTONllBhvWAZ359uIEsVvz5yAItJY3utOFl85FTUK2MQeJyK26jJFvK2wT1
         YoSuw4aygtc5mIRphP96RD3KnM25ChPE/7FavhRwTOzp5hYYPGJ3ea1QlGkYm8r+QJb2
         DUnsVHogHDS8BVIKfzXVEEHvGn5SDc9WLxCEWQV4nYWRLI4UbGs588Xu+wddtd/GQdRR
         1RQg==
X-Forwarded-Encrypted: i=1; AFNElJ/IJ16Cug8CZYTzS2YxLEb8ffiflD6hAZ87he0IAj/aKsg6iylY4ZVFFvmMmLK1qsvCoT6CkgeBRl+dMkMB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt4zrPBhMvn8kBgJkC/U6iSR4pZQQW65cEAkr7sBUScscf+k4N
	JDadg+NtwVHGMwlJgcm8qMaxMXbay0jGorUR5gWgrfIcOoxBJgY2ipt0xzOoRQBhEdRm3qJVEms
	mXUttEZxnYuynjDP+4sI43//rk977XSJ+y+tLlj+cVND1CTO09h19togOX/jngd2CkYje
X-Gm-Gg: Acq92OHiEG2sXoQrIy/fISecBsoRXm97AaSyO/aekXWIyGJ5mssIAfnPmdKuZSUB067
	nKD84/pqkpux7mATm3jDaEq+U0oo9gr6b5H+eTNh4XH+zqPirlgCMkXTGphmTW/XeLMQFtZLp4c
	12ckQLQ/nZEN5YX/Kd5UwBJBfgw8QSnrKwZFOoswHS3wVj3bps32P12gtutx2flCzwpZ3rkKe1F
	J1Ee1SGxONJwQq1q2tYq84hrrcVpqkLrow0owc/8ThHb3N8IDMOhwgMl4TGwN5uHZ944jqQW7b7
	RXAUKhOGfIDAkz82hQbonj8i4V436aoFJ72dQsc23wW6xgGP0Tzh6MtFAg1DA3XruiLwQZbRzKg
	TeQWCwWZfB5qrbcLSVgjBqpqxCW4H8oWC8L7/16amNVWlD+7bmjjFW+IlBy+39AV5rdbvk8ehcG
	JuQMnwcD8TC48mau1ocVGQB4U20P916/bqNow=
X-Received: by 2002:a05:6102:41a6:b0:636:984a:1e5d with SMTP id ada2fe7eead31-63a3d4294famr12951559137.11.1779280392331;
        Wed, 20 May 2026 05:33:12 -0700 (PDT)
X-Received: by 2002:a05:6102:41a6:b0:636:984a:1e5d with SMTP id ada2fe7eead31-63a3d4294famr12951537137.11.1779280391840;
        Wed, 20 May 2026 05:33:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958874fe01sm30639941fa.23.2026.05.20.05.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:33:10 -0700 (PDT)
Date: Wed, 20 May 2026 15:33:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] Bluetooth: hci_qca: Support QCA2066 on M.2 connector
 via pwrseq
Message-ID: <cx3pbr47tsy5mnag73oopkodnx4jgoiipz5pzrp4uze7mk4fgg@zogzww23ueni>
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-2-9f6942310653@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-monza-wireless-v1-2-9f6942310653@oss.qualcomm.com>
X-Proofpoint-GUID: 8VMR1DMGUNVuqQvjOV024U5HjOLRAgxA
X-Proofpoint-ORIG-GUID: 8VMR1DMGUNVuqQvjOV024U5HjOLRAgxA
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0daa09 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2I_6hNrxhXWvIde2sUgA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMSBTYWx0ZWRfX1ldScT+39Ooy
 iGsbXA0xOU2Qo9EZeZqFT7ptmmDUEVSDuV+ZODj1mdB7ykt/hD3jhd2dhN8p8QmuIHzZaYGdfyC
 QEcYiuSkM7IlLBLZ/+PyMVpY+mlaPRswKGJpoga5FwlQ4zYteDH10ahvPCjt88hY/382/B7GEBr
 426lGMrV5ijLYabtExhENwcCqIESVdQa7T+2nkBe0wdCYhC+etn9mpLjXl6Cf+5/YQflEhUSexS
 84FPIaZOcI9Io+GaV9dPotgwCPGA8LFhcTn8VgLbURy5Q4tFwvy8IggnPKixL0kE9aGZ+U8dpBb
 jssaTh8Y+KXiOnxbqJVChn2iTIfM6ra8M8pzBX5qvd7VJHU6Wc2fU8qAlYR0pulNxu2xNhXXZsz
 5Vdk/MDazOY0Ra3qpdk29xFYNumgv86aYTcWgcQx0U/H+UfkAo8L1SYbRZB8cbZXKsVu6lKEi2l
 pSg008pc/P+4gZcQVhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200121
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108741-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AE2858DCD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 01:01:43PM +0200, Loic Poulain wrote:
> For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable
> is controlled by the W_DISABLE2# signal managed by the pcie-m2 power
> sequencer rather than a dedicated BT enable GPIO.
> 
> When the serdev controller has an OF graph (indicating it is connected
> to an M.2 connector), acquire the 'uart' pwrseq target from the
> connector's power sequencer and use it to control BT power instead of
> the bt-enable GPIO.
> 
> Also allocate bt_power unconditionally for all SOC types since the
> pwrseq path is independent of the SOC type switch.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++--------------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index b5439b9956cfb0497e6ba6ccd9ed61224d23a9dd..de5cba7b7f44e280a48dad5d670fa2758d3268d0 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1873,6 +1873,9 @@ static int qca_power_on(struct hci_dev *hdev)
>  			/* Controller needs time to bootup. */
>  			msleep(150);
>  		}
> +
> +		if (qcadev->bt_power && qcadev->bt_power->pwrseq)
> +			pwrseq_power_on(qcadev->bt_power->pwrseq);
>  	}
>  
>  	clear_bit(QCA_BT_OFF, &qca->flags);
> @@ -2415,25 +2418,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  	else
>  		qcadev->btsoc_type = QCA_ROME;
>  
> -	switch (qcadev->btsoc_type) {
> -	case QCA_QCA6390:
> -	case QCA_WCN3950:
> -	case QCA_WCN3988:
> -	case QCA_WCN3990:
> -	case QCA_WCN3991:
> -	case QCA_WCN3998:
> -	case QCA_WCN6750:
> -	case QCA_WCN6855:
> -	case QCA_WCN7850:
> -		qcadev->bt_power = devm_kzalloc(&serdev->dev,
> -						sizeof(struct qca_power),
> -						GFP_KERNEL);
> -		if (!qcadev->bt_power)
> -			return -ENOMEM;
> -		break;
> -	default:
> -		break;
> -	}
> +	qcadev->bt_power = devm_kzalloc(&serdev->dev, sizeof(struct qca_power), GFP_KERNEL);
> +	if (!qcadev->bt_power)
> +		return -ENOMEM;

This builds bt_power for all devices even though it wasn't the case
beforehand. As such, you can drop all further `if (qcadev->bt_power)`
checks in the driver. But, you also need to check that this won't break
support for other (older) chips.

>  
>  	switch (qcadev->btsoc_type) {
>  	case QCA_WCN3950:
> @@ -2543,7 +2530,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  			return PTR_ERR(qcadev->bt_en);
>  		}
>  
> -		if (!qcadev->bt_en)
> +		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {

And this breaks support for pwrseq for non-M.2 BT devices. There is no
OF graph in such a case.

> +			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
> +			if (IS_ERR(qcadev->bt_power->pwrseq))
> +				return PTR_ERR(qcadev->bt_power->pwrseq);
> +		}
> +
> +		if (!qcadev->bt_en && !qcadev->bt_power->pwrseq)
>  			bt_en_available = false;
>  
>  		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

