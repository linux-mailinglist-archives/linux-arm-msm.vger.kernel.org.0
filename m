Return-Path: <linux-arm-msm+bounces-116009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pB2IKJlbRmpcRgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:37:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 202C66F7B33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:37:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Eklqlkdk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kGc+VJ8C;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116009-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116009-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54A1C3019BB2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3713AC0FC;
	Thu,  2 Jul 2026 12:14:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968E26CE32
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:14:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994496; cv=none; b=YaaU4WN51xzuNrUc+CQ80thiWqId635v1aigTBZ7YWDyGIpcOX/GHh3wjfnWS8qtfMYU9wB+a7wwjJk2fH8W/xRXKiB4NAFkTZzUHQS2v68KNufeT+mUyhHVIVOxtq3E7EWlqAPqKufk0FRvCLiUkz/yql+hhK3Nz5ij63xEGWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994496; c=relaxed/simple;
	bh=3mmx+/0sXAdWT+pakhHyX3kTBrQwKkeYxwkz9M2nEYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJdyRPtyAxwXApQz7KsZACvgXb+O1GxkDkKERhuiuPtI94mpdMwLCPJSpOQjcK/rA/hTdQswMeO/pTbEBKX9HUFbsuuUYd3BvkmGwI4IQ/SbSJd48uE3T7dwT+Qave2pIgF1HWQvb8u9snJtCkURAduv0HkfQRSXAxGXqeaawCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eklqlkdk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGc+VJ8C; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nZYf4139688
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zm20ylCeMzuZiz3s/y5e/wk5
	Pyn0IY6ZLPEKM9fU5YE=; b=EklqlkdkxONpR0ssH8uNTgSBlMOWyb7qIXEVdKze
	tOTnf/GGrpmP7faX6K6FJMtJhVhsazQRM07+nFw6XnY5Rp8voe1/WC5w67qG41AU
	Ye2T3Og026cHn0LN4YASci+ZjzTJzTIN0h/1Y9/CXuzP/KYTyHgOu4RnGwsh5ZLi
	ZpVY+YZBRfxVTcBRBGDbDg8TKFVdt7oWbjiFq5jBFS9U2MSHTbK9354u+6HThI81
	WJJDl1e7PkeWHdvMDYFJxsp3h5L9lsCiMHv7264ucXy3LAXmyWTHY1R1xkOPkcb2
	RdC89JYeALQJvpOBxrfQsdyTSywoKJHoTXo4yYc9E66RbA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr8hff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:14:54 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966c4d68d91so344930241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994493; x=1783599293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zm20ylCeMzuZiz3s/y5e/wk5Pyn0IY6ZLPEKM9fU5YE=;
        b=kGc+VJ8C/QhXZ9xObaTi8QGSmoncLciXvujqqSoqLXJ86DYu8HudvaV90wntNvGQ6B
         EoC6CEHdTcq0nznU+OkEmts9dDaF6AAFyWmwwSlaD+7QMDA5pcD3qR55T14LJdUkp/g1
         6dlt6EmEAPBk5aDkAXtZbZKEs0BGbnr/PrjHamh/Y/CqUzIjHoOAOfdWNKu1Fj4VJ+c5
         8UXMfZQ6EGFGLefCjtPfup8jQvve0n+uWGrrwIjlf/lt5gPIYXpwQQLvtjtT0+3iS8g0
         ri2FbRfsDCWq4hLsVxJ5lCqaYgsvNkHzXVojnPGfrtL8uIlNgicQ6xvmnhsddGTc/GFG
         7loA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994493; x=1783599293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zm20ylCeMzuZiz3s/y5e/wk5Pyn0IY6ZLPEKM9fU5YE=;
        b=eT3nyuZahsSz+YS7lsIuYLKUxqyaekh+D8yysoxS13EfkZn4MMWB9CMubzY0d3a6X/
         bruZoPMRQ9bJvvA9O/v1k2eIDFoSGkD7Xlg9JI0mS2gdDdZwisk3xQ6WJPqvhQh3B2vH
         o9KMg9bZD+IK4LbYkk0BMislct8I9LDDxkopuKL5mH46yJ2YiA1XOUdbHgALW9LfiZmA
         grvYbj3rYs7eqgccNN03o4ad3kx6vlLM4B5Ki6WRGDEy8cbJKl5E5Nn9TwWsStpDxDDc
         e2TwoETBed4ERy3pc6avFU8LSXFGFMucQWltjJAPOLRfCzcegN1SgSQxsCC3PGx8iOb/
         LOKA==
X-Forwarded-Encrypted: i=1; AHgh+Rrd6C4Tt/a6DX8z7H+TR31p8iXnr+1r4dHTPs6pNyO7xc8fg8VYHMCTjyl+Tzazshu7/J06S+G5U4bevcLx@vger.kernel.org
X-Gm-Message-State: AOJu0YwmrzF8OGq9TzkoxF4CglXhjA97BRdNFjPfstQVkwscsFl33YQY
	fsuZ7VBzocVUDJBCf++IuuaCkXqbDsGqavoHErGU4b38ZQ31virX5kYUWHJllNhZHFxtZJfq52k
	nyyYo7DYJbQJbTmahrSQkZ3ja3JyTmW/sJZZ1RGhO4nm76ggrdNBcZKXWCnTzMij4xvxG
X-Gm-Gg: AfdE7clzSsDtX9zCHzNb5wKdwV6qAEUkDkQV9R0zMbLA17F6Bl7ShAGinhJb39cMhIH
	wGIQYDq7rryC2xT4Yem0HqwuImsXiE3klUbMP4kCADN/lYmyezY2IzsbbHnmbluoUYpZUUtR+pz
	Y5YifeDgpyN3nZqfRQBmiNhaRTlvjS3Dkli7n7kzJ2MeWJKhYCDL6oM9awl4+YqkqfPMF3XOrdw
	LIWKD9SUxnxXiEw1a6mqA4nuTfuoA6NB56bByuqvCW8YShuPoIxGm17MVYwoD+v2KTL4R6xs9Tx
	jB4Wep6nw98oHeYPp1N+OL5WWp3LWyyRULcAeZVNEETXjVyaA8A0tW0j4DtYK2uzN24VE6LNldL
	tCGeCnuRrZLOrMbxNXpWBFDOr3r1kAbH+FURyyYfR3qN/hTbIHundT7bnGdAYnHj26IQxRjg9SF
	pJomUBLyNsj3nhwXqxtjaJqMHb
X-Received: by 2002:a05:6122:8b12:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5bddf5bae25mr1989774e0c.7.1782994493314;
        Thu, 02 Jul 2026 05:14:53 -0700 (PDT)
X-Received: by 2002:a05:6122:8b12:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5bddf5bae25mr1989761e0c.7.1782994492816;
        Thu, 02 Jul 2026 05:14:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89eb6ffsm650658e87.83.2026.07.02.05.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:14:51 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:14:49 +0300
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
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Message-ID: <43re752djujsh2kiyvjlkpmztxsh4atg6472qhir4lgay24zbo@mtlkn2xc2ors>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zCK6ca6iedtos6sJcClioXfvjfjVb5My
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfX42ztKVHA9xBq
 UWK/JLpl4yBOxEVEkAyEDlrliA4sVT77IEvzGt2uNGlX/iR/gjfjxMoPphNHGRIQgbn+rlmS50l
 u+r7Ho9NGV/DdTwrYBo1p6ZRt3woVXc=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a46563e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=GH4E13IOXdwHnVtn7D4A:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: zCK6ca6iedtos6sJcClioXfvjfjVb5My
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfX+/PQPwNK+xoS
 Uquz32BSQUZ6iTZvJKXdS5QmX+cDwvSs7nVxgwVcUsRif1b9M6iRMkYrZNJAI1sEzjNR0RnZe/A
 uL+YlXmpbYR7atXmJHefvD+MgvZl/kbQrLLGMuuk6g0kojDZKfqUWmZ6/aLjGE803F+uKG+bG4s
 wMsAFlWCkNLoLQMrrC7sr0/3frUp9mc9x4x3xC0T+rdSFN5FbnzoxxcyNhX//9bpPk7bJ0WgTzW
 oOc1+S0VclQBUbOJlk2orf203YQIzky4rqIneMbvT6oDUk8Bqfc7JvXXqEx27GXAtSRpRBfPXDJ
 RQWv+u5Ny9IjCTkNHN7vpA2G/0PqZHuckoXCW77b/io1KZroNPZoHVS1gcWwQpghIR8LrAzXlQX
 R8P3nsOmQIxBRwzKvlb+8KJXBZDNjrNYhNuNWdU8kyX3S5xsP1d4hI9M7kVTn/EKs7XIN2cP72Q
 xEyUiXx0jBhrvMqU24A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116009-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 202C66F7B33

On Thu, Jul 02, 2026 at 12:46:15PM +0200, Loic Poulain wrote:
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

Can we just fold it into the main struct?

> pwrseq path is independent of the SOC type switch.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 81 ++++++++++++++++++++++++---------------------
>  1 file changed, 43 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index e09debdb00a1b8e74ccd5de6147e240e533b4594..b04593a96e14ac9e87ae76fa00eda308e81dea25 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
>  			/* Controller needs time to bootup. */
>  			msleep(150);
>  		}
> +
> +		if (qcadev->bt_power->pwrseq)
> +			pwrseq_power_on(qcadev->bt_power->pwrseq);
>  	}
>  
>  	clear_bit(QCA_BT_OFF, &qca->flags);
> @@ -2256,7 +2259,7 @@ static void qca_power_off(struct hci_uart *hu)
>  		break;
>  	}
>  
> -	if (power && power->pwrseq) {
> +	if (power->pwrseq) {
>  		pwrseq_power_off(power->pwrseq);
>  		set_bit(QCA_BT_OFF, &qca->flags);
>  		return;
> @@ -2387,6 +2390,35 @@ static int qca_init_regulators(struct qca_power *qca,
>  	return 0;
>  }
>  
> +/*
> + * Acquire the M.2 connector power sequencer.
> + *
> + * An OF graph link on the serdev controller is only present when the BT
> + * device is attached through an M.2 Key E connector. In that case the UART
> + * enable (W_DISABLE2#) is driven by the pcie-m2 power sequencer instead of a
> + * dedicated BT enable GPIO, so grab the "uart" pwrseq target from it.
> + *
> + * Returns 0 if no M.2 connector is present (nothing to do), a negative errno
> + * on error, otherwise 0 with qcadev->bt_power->pwrseq populated.
> + */
> +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev, bool *bt_en_available)
> +{
> +	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
> +	struct device *dev;
> +
> +	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> +		return 0;
> +
> +	qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
> +	if (IS_ERR(qcadev->bt_power->pwrseq))
> +		return PTR_ERR(qcadev->bt_power->pwrseq);
> +
> +	dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
> +	*bt_en_available = device_property_present(dev, "w-disable2-gpios");

I think here you are looking into the exact details of the other of the
graph. There might be other devices on that side, while the code now
assumes M.2. Or, consider having an M.2 controller which handles
W_DISABLE2# internally rather than through the GPIO.

> +
> +	return 0;
> +}
> +
>  static int qca_serdev_probe(struct serdev_device *serdev)
>  {
>  	struct qca_serdev *qcadev;

-- 
With best wishes
Dmitry

