Return-Path: <linux-arm-msm+bounces-81228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E17C4D48C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCFC7189E099
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35FC3358B9;
	Tue, 11 Nov 2025 10:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHSpOML9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0vEfFl1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A343546E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858434; cv=none; b=PwAGqWN0Xd9qd24ztfaP6RgMu/Wst247Pk6V9zOJCy0VRPXfZoIfO22d0XsnjntsVCeKn6qA4u8Xt36dOJrUhrA0Y+ttR17715RlO2NWAJQK0rg35270SESqXRkfe53ardoa1w7+lpu4s6DJiy4gsVgs2Yr129SMlogC3Eo9P1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858434; c=relaxed/simple;
	bh=YfYQWQmJBuTLR4ZkEPAzI8IYEKysiu/TWlhvxpn+hwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXaYohFhT2rXmSQjgqCTEHK23ycC6fTaUc98YDjU5QVamPXsIGvaLYPRKW9wiqhfMPjmvJvlAFjxzZnV4g/wkola9b1pgF3AKgtIuA7/3jDXXDeFZoSHDg8BR2Yhgn5lG0HmDMN0pI3l3bxvn43nZblEBhdaTAbODfhEvgxDy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHSpOML9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0vEfFl1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB5Mssr1479924
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JOY8DznZJ+a8l9NqM6488uYE
	YeU/Gs9AxiuVXqByErA=; b=MHSpOML9B/6i/Vq7kz/qZnPmBsx2nHjRO9HEkYFl
	exCGKYKrwBpQ8i7HHiaKgi9/wAD9RAUiFmWYJC7Y6SEiZHwnltNfulH5l//WlGjR
	tijcIyaSKILq+pemr+9H2igZGn5kQA+dzKJAQFO78uTRc8BFje8bKdZzOU5zNVHj
	4n8Us25PEmIl08iVLpV4saYiOtRMtDK5inT3PlV9NoApv6ikd079LHCuOCWNYp17
	NQpLsuKkGK0XzoWwDar/BbKqm15/A86fD65o23muFPg32ZArn74cJCFtDi5cBy+A
	6ax5D6pis2PPLR05TTnRJiMhwuCpfOgUaGuIPjEOH8/KFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxxu8x4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:53:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edad305681so56646351cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762858430; x=1763463230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JOY8DznZJ+a8l9NqM6488uYEYeU/Gs9AxiuVXqByErA=;
        b=W0vEfFl18rPA3l/+jxMc/y0VcjH3RFMRP5jzgXbtb+wJkNUAvreHHbAzzbeK0kK+WQ
         luDR/0MyYD4nAbgb7gZlF9Ik6Hza8LvS/TIIB4wHvvkCF8I08Hr0tPxTfAa0vITX/mVW
         h+d4yvYfxU11N2r43uQpF2I1eMeSBSjBa8oppKx0bdp3XgYLrkJ/8xtHdJlK9cfsamlf
         scSIlqjhUssuNCLnFLQM4PS/XC2alLxQSW3mCYKFwvleautCI+qKatgu8JSVm8vJ5yPs
         A26goKhDn4tfe/igC81NBJr0IVfwuRozCeOgnDdyBcQs2UVe+9lnO5MFKcH9BpOcx+RR
         xcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858430; x=1763463230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOY8DznZJ+a8l9NqM6488uYEYeU/Gs9AxiuVXqByErA=;
        b=Gt5F3/2+bm2ZAuraRxaHLCrdvLpnMoQQ2ebjhdL8wYbbWmfgr3MOOtH0QI8I1wbQUU
         sZvoHt1vwa5Y6MzmAwj0ugWvsS6rxZoucUx/79KcS801hABcwp1pBpdHxFE12bZzbFbr
         f9XvxkIlC8YaVl7yTE4dz9rCtK/cGV/QFYCPIs/KjtrkmMNSq+bgelA+8yyy2yqLfIHP
         Q73+waW8t0QE2gW3CO4jcFoNg6HOAL3Ll0wCIP2GKzIUd9kmwnVKofgUaGUyL/aCk9wg
         ZL6+UERir4NTK405/zbtiAkRUTJl2MhU8m0qj6Lbe/BcQMzIpKPe13UG3xRdLPhc/F3J
         4Jrg==
X-Forwarded-Encrypted: i=1; AJvYcCVA2Q/IfyH9rWv7i5RacwTOWR1qRytfUfwsJR8DRJ+ZkTuPaHtGkVAv/tvfRla1RxUhHzO8BuEB3bxxXW6S@vger.kernel.org
X-Gm-Message-State: AOJu0YyLLm6qhPC7Ysqxb+Dvs3UjrteGaT2laHzCyXsXICq0fGCqvkdg
	E/4IA0SiMRLQFqx4oIKvHVu8DN6ftbagfPnI27M0tE93gls8ApbK4rDmLXmMUlRjnKsD/qrYt5K
	9NIUAcIYNw+SZaChf4YBKZkHSh0+li6dj6+HYcYgCoOLkj/CcyZvsSBpBdCMgaPMHvT//
X-Gm-Gg: ASbGncvlAI2Uz3LABgVXJluPoUgkBvpXcvNrjuKE645RDvGoYMzzXOBIZGSszPfGHGj
	cKfWf6qoPtU21gEQCfC8cIhNDxqPhxzG72USHAaaORJcPzXUYAuCE+xDE+zLzGqOBTEGwkNbDL+
	g3MSCNkGoDRmwG1h1NLsPkkeI+6tfEWLjgXkhRKw9rGJVQttMUqbQiSbHBk5OeKiY1X+WEh7BPS
	ouaz2/aqCFbw/fo6YNDqCzVVmrdue8cU4BTf3Z6fhdGpfAQml2/mfDSWJiLzgExFxznhkfp8rVd
	b2839aRxNHDjGDW4N+0LNfgnBLJtZvyyoE8XvTvDs4L/a7k5NgbV8YcX+1LL/JLGRnwjpWu9RRF
	k53htCkUMqOerkP2Ny2GOle022Khbsb9pQ5H1yY13i1lB5lHayZZ6TtPurOuy3L4Msm6Dk8VTUg
	3E8tuct9hz77Fg
X-Received: by 2002:a05:622a:1b8c:b0:4ed:423d:48ef with SMTP id d75a77b69052e-4eda4f9afffmr135268981cf.40.1762858429825;
        Tue, 11 Nov 2025 02:53:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvvKBaA3vCc7M1zJEqozbkT2VVEJ9ltvHYd0jpad02KRmovR5j8eDCwsovOwsBAEB48mkNpg==
X-Received: by 2002:a05:622a:1b8c:b0:4ed:423d:48ef with SMTP id d75a77b69052e-4eda4f9afffmr135268791cf.40.1762858429296;
        Tue, 11 Nov 2025 02:53:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a594e2fsm4794339e87.99.2025.11.11.02.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:53:48 -0800 (PST)
Date: Tue, 11 Nov 2025 12:53:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 1/3] net: mhi : Add support to enable ethernet
 interface
Message-ID: <z3xztoy533f5gqqhctburexwbzazbq5reu754n27tb453utnwk@bbosumjjcuf2>
References: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
 <20251106-vdev_next-20251106_eth-v5-1-bbc0f7ff3a68@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-vdev_next-20251106_eth-v5-1-bbc0f7ff3a68@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4NSBTYWx0ZWRfX5XjOc7Zlgfjg
 +92wIf1xcoxiJR4r9A3mNgx9I2icEnzWD5IsSXMGxp0/oAyVNKANiCXkiR9dUuCt5anzPNu/sKF
 JshENuw1EJ6IvfRWaMbW7wkYhPQvfprimXfADo7iQsFRhjEfpuWCiXQ2ct27ZZVed9oruK16zvE
 ctmqvcXGfSbJ1x5yOk86Vsz9JxO7RDZQqXJVl52magvL6qSMjZIDZKmuiuu2OwSZBnCsr279v1C
 V24YikwmTEH3A7S2tWA7TejC764n36lNL1/9vhmjk6hY1s3CQAUcaPqnUK/WAGtDDKlLHNhqES4
 OIlICub+7HjfTrsHRMv/l4QEg4GpTOpZHRebu/r4u/R1EQfXl5/o38WscBdFYoL/0GlfSXbbumV
 8ldyPkmI+DTCQCvf6MILd+vuujl9BQ==
X-Proofpoint-GUID: IVlJ8D-4ZbGHYbYbWOaYm1jLZuC_s_Pw
X-Proofpoint-ORIG-GUID: IVlJ8D-4ZbGHYbYbWOaYm1jLZuC_s_Pw
X-Authority-Analysis: v=2.4 cv=TfObdBQh c=1 sm=1 tr=0 ts=691315be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tsOYRPuReCfgA1KZPE0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110085

On Thu, Nov 06, 2025 at 06:58:08PM +0530, Vivek Pernamitta wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> Currently, we only have support for the NET driver. This update allows a
> new client to be configured as an Ethernet type over MHI by setting
> "mhi_device_info.ethernet_if = true". A new interface for Ethernet will
> be created with eth%d.

Please describe the reasons for the patch. Also please don't use words
like "This patch" or "This update". Use imperative language instead.

> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
>  drivers/net/mhi_net.c | 84 +++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 71 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8e449b5a427993abf68e8d032fae2..aeb2d67aeb238e520dbd2a83b35602a7e5144fa2 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -11,6 +11,7 @@
>  #include <linux/netdevice.h>
>  #include <linux/skbuff.h>
>  #include <linux/u64_stats_sync.h>
> +#include <linux/etherdevice.h>

Keep it sorted.

>  
>  #define MHI_NET_MIN_MTU		ETH_MIN_MTU
>  #define MHI_NET_MAX_MTU		0xffff
> @@ -38,10 +39,12 @@ struct mhi_net_dev {
>  	u32 rx_queue_sz;
>  	int msg_enable;
>  	unsigned int mru;
> +	bool ethernet_if;
>  };
>  
>  struct mhi_device_info {
>  	const char *netname;
> +	bool ethernet_if;
>  };
>  
>  static int mhi_ndo_open(struct net_device *ndev)
> @@ -119,11 +122,37 @@ static void mhi_ndo_get_stats64(struct net_device *ndev,
>  	} while (u64_stats_fetch_retry(&mhi_netdev->stats.tx_syncp, start));
>  }
>  
> +static int mhi_mac_address(struct net_device *dev, void *p)
> +{
> +	int ret;
> +
> +	if (dev->type == ARPHRD_ETHER) {
> +		ret = eth_mac_addr(dev, p);
> +	return ret;

Why do you need an interim variable?

> +	}
> +
> +	return 0;
> +}
> +
> +static int mhi_validate_address(struct net_device *dev)
> +{
> +	int ret;
> +
> +	if (dev->type == ARPHRD_ETHER) {
> +		ret = eth_validate_addr(dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct net_device_ops mhi_netdev_ops = {
>  	.ndo_open               = mhi_ndo_open,
>  	.ndo_stop               = mhi_ndo_stop,
>  	.ndo_start_xmit         = mhi_ndo_xmit,
>  	.ndo_get_stats64	= mhi_ndo_get_stats64,
> +	.ndo_set_mac_address    = mhi_mac_address,
> +	.ndo_validate_addr      = mhi_validate_address,
>  };
>  
>  static void mhi_net_setup(struct net_device *ndev)
> @@ -140,6 +169,14 @@ static void mhi_net_setup(struct net_device *ndev)
>  	ndev->tx_queue_len = 1000;
>  }
>  
> +static void mhi_ethernet_setup(struct net_device *ndev)
> +{
> +	ndev->netdev_ops = &mhi_netdev_ops;
> +	ether_setup(ndev);
> +	ndev->min_mtu = ETH_MIN_MTU;
> +	ndev->max_mtu = ETH_MAX_MTU;
> +}
> +
>  static struct sk_buff *mhi_net_skb_agg(struct mhi_net_dev *mhi_netdev,
>  				       struct sk_buff *skb)
>  {
> @@ -209,16 +246,22 @@ static void mhi_net_dl_callback(struct mhi_device *mhi_dev,
>  			mhi_netdev->skbagg_head = NULL;
>  		}
>  
> -		switch (skb->data[0] & 0xf0) {
> -		case 0x40:
> -			skb->protocol = htons(ETH_P_IP);
> -			break;
> -		case 0x60:
> -			skb->protocol = htons(ETH_P_IPV6);
> -			break;
> -		default:
> -			skb->protocol = htons(ETH_P_MAP);
> -			break;
> +		if (mhi_netdev->ethernet_if) {
> +			skb_copy_to_linear_data(skb, skb->data,
> +						mhi_res->bytes_xferd);
> +			skb->protocol = eth_type_trans(skb, mhi_netdev->ndev);
> +		} else {
> +			switch (skb->data[0] & 0xf0) {
> +			case 0x40:
> +				skb->protocol = htons(ETH_P_IP);
> +				break;
> +			case 0x60:
> +				skb->protocol = htons(ETH_P_IPV6);
> +				break;
> +			default:
> +				skb->protocol = htons(ETH_P_MAP);
> +				break;
> +			}
>  		}
>  
>  		u64_stats_update_begin(&mhi_netdev->stats.rx_syncp);
> @@ -301,11 +344,17 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>  		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
>  }
>  
> -static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
> +static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev, bool eth_dev)
>  {
>  	struct mhi_net_dev *mhi_netdev;
>  	int err;
>  
> +	if (eth_dev) {
> +		eth_hw_addr_random(ndev);
> +		if (!is_valid_ether_addr(ndev->dev_addr))

Can this actually happen? Can eth_hw_addr_random() generate invalid
address?

> +			return -EADDRNOTAVAIL;
> +	}
> +
>  	mhi_netdev = netdev_priv(ndev);
>  
>  	dev_set_drvdata(&mhi_dev->dev, mhi_netdev);
> @@ -313,6 +362,7 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
>  	mhi_netdev->mdev = mhi_dev;
>  	mhi_netdev->skbagg_head = NULL;
>  	mhi_netdev->mru = mhi_dev->mhi_cntrl->mru;
> +	mhi_netdev->ethernet_if = eth_dev;
>  
>  	INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work);
>  	u64_stats_init(&mhi_netdev->stats.rx_syncp);
> @@ -356,13 +406,14 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>  	int err;
>  
>  	ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
> -			    NET_NAME_PREDICTABLE, mhi_net_setup);
> +			    NET_NAME_PREDICTABLE, info->ethernet_if ?
> +			    mhi_ethernet_setup : mhi_net_setup);
>  	if (!ndev)
>  		return -ENOMEM;
>  
>  	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>  
> -	err = mhi_net_newlink(mhi_dev, ndev);
> +	err = mhi_net_newlink(mhi_dev, ndev, info->ethernet_if);
>  	if (err) {
>  		free_netdev(ndev);
>  		return err;
> @@ -380,10 +431,17 @@ static void mhi_net_remove(struct mhi_device *mhi_dev)
>  
>  static const struct mhi_device_info mhi_hwip0 = {
>  	.netname = "mhi_hwip%d",
> +	.ethernet_if = false,
>  };
>  
>  static const struct mhi_device_info mhi_swip0 = {
>  	.netname = "mhi_swip%d",
> +	.ethernet_if = false,
> +};
> +
> +static const struct mhi_device_info mhi_eth0 = {

Unused

> +	.netname = "eth%d",
> +	.ethernet_if = true,
>  };
>  
>  static const struct mhi_device_id mhi_net_id_table[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

