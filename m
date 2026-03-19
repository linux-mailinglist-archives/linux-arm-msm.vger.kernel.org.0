Return-Path: <linux-arm-msm+bounces-98624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL+BBNqMu2k4lgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:42:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9022C64AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53EC3302DF8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAC1399350;
	Thu, 19 Mar 2026 05:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7xhtH+X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E8Ob6+oy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E492399352
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773898967; cv=none; b=M/LY/92faBuhMNIizr2rXzgqWV98KBbpY5sOnwoDDEe4fCc3p/lDyveGpJfB+i+3TiiaNAD69L/eF3ILB8YcV+RSZqgnNsQ1HWRtvVr/S2B/ybRdgOb/Ab+s2/CevPwZbbympEwR24TlSMDRbGHfF5TFac4F1fi/jz5aQXjzQpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773898967; c=relaxed/simple;
	bh=exRLnuHCQSsOrtJ71v/zE9ncFjdeTRRVRFrKK/OOVw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLAhpakyLmRqSayCoiLUQj5GmlC2k9HESgTIVKuVmujeXIRtgn3WXE1kT8cTe19suhdsinLgKpdr9kpY1XImlBu69khsXdYYo7fTR+AsdGnaHd85V+l97rFUMJKmOqpSJgz/dMRFNLdOdhXTBvnjUOc1qFwZAH19qyMJw5dHzt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7xhtH+X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E8Ob6+oy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XXqW3171753
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r6IJ94K1mctnGXhKKrgdpugngvotzrGmL7GIzeq9Cqc=; b=B7xhtH+XyW27VEbe
	DDarm+24B/8/90sxSA6hRPVc4hCmG385Aa1oJjMwK6hTpBva8vvuDXB7re5Qgulz
	l3C0E8KsX+h0rAKuvolDy+AyxTH9STcXZIOz7Edyk7Rwjs0JVaTC/HVszP9j3679
	aOIUKJrHsuvX3QUXDfEzoKZEJnOn9REKe9xUue6LtyHNdzSvnt8VojCWQl/xi//l
	pF0woFQEBu/oHzYEc/xX9FcFIlgzkmtCXyLWuCFKSSWbaCmZTiDchjZN2hYkiAa3
	SjVwSJlQC6OhyVwN9LKNA0s/OGBKbiBbF9HVQxZEZaepfejqEn17+iNFtLSPm1S/
	FzCOiA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9hw74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:42:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937c5b742so40467721cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 22:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773898965; x=1774503765; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r6IJ94K1mctnGXhKKrgdpugngvotzrGmL7GIzeq9Cqc=;
        b=E8Ob6+oykgNKqDUNaP4xMd/hTR0d10cKWqpTy8qxKJI3r8kUBqu7mLjyNdX6FWXGjw
         jOcwLEOpvVnD4t7tKZuvueelvwy77Epj7ygTBcSaafK+tV9cJEQajNGd/xnT9SYs1p0b
         tMhWfi63NYcLZGTuk+zylU8V/xVHZqMRAu3/qMoGVwjz132g8Yk/xroE3ttH/xOHt+mm
         WaANpDjlm15dJYjQRTtgET1Nws2aewuRtfo8y7QjiYFdw1BIHwgjt6QKyiyKm/XlBDLF
         rd7be3G+U4YCtO9RPbJ3rnjBGuT3AiFVNsLorE63U5zC9VEaNLfVvns1LcsAcq01QxEZ
         /xXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773898965; x=1774503765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r6IJ94K1mctnGXhKKrgdpugngvotzrGmL7GIzeq9Cqc=;
        b=W+Lb/tdMYz/69PUiEpA4CtwY2XAF3iFcBsYuJO+t1ulfG0ioLe9VQtBYI5JAHNfxPN
         COwqbQlEYhl3otFzHy4OMhcLefr7mlk7FNM8NnNptsEBKQ6V7CpUfCriqf+lZHTK/gVT
         ARnvIb6m9CJjYb3+rbcaSWg828RHcqBhqdx748xmd6roeV7DGlbBT2tU3hODhXE+eXla
         86m1e0ycNVs34P6g9/8e7uiNXiwFenDRcvv1hVK11xAaARMsLqmy0M/STjauDBTRAV+F
         +aldjr1UrB6HENrzBh5f1sFMYdNxC2XqMQRVncieP7qC+KQQQeAoLtHYEd20N7tDgVD3
         dEZA==
X-Forwarded-Encrypted: i=1; AJvYcCW87YdD96qbzPnkdXDaBq4D0uWWVg14Y06jKv6AF6gscKSOe8Llqig8om1fEM3p/sS1MCX1Ywevxed36T/+@vger.kernel.org
X-Gm-Message-State: AOJu0YyFo9sXlVkcNN2QlNeDdjAyXbx0GcM2Hbe22HZpfxT4oetwVX1g
	z4D5t9IOwGDre47GrDUJgGRthz0TgvdOEpz+6WnmOKxQ4kMVYnV2SobJsrC24S7NcJMV1Wz5isn
	rwky39D9qVLZPsIcH3AVJr51zJMBmm4cxzzt+CYnAJRC/Zc/A2Gxhxi/Fib/ZzVewj//d
X-Gm-Gg: ATEYQzxVKZHRj7Suo+7pSGfjTow/iTFnAveirL6Z7NTL6m0aWDaYdo8OWBE+jziLR2V
	33ZuCoeHvjf2/13vBK8uZProqumY0P5OWrgBjzSar3X3QFG6dgW98dvX0pr33WxiW9YoA6IgRw2
	Weei7uFuabYfvPriWP+F1cMXrd9LzwTNDAK8ojiLNS7cIjShG8vO7Ac9B4WSB5CpSyvUz3dpmTW
	OO5WTI5UB+3ZtORXrPobXhbBLpXuXmf7m8XIkmJU4eh0gGOxhHnfgj4IQEUlIVTA0suEhIZcf6G
	wBZr4hv5Pcfyeir+/q+Iqw2Xbq5sPIc8aptiNKjy+/0+wLU0vH7sqj9UXlDnN7wTXtTxrSyWeN2
	deOr4wJ+ulWBfT9DnmY7AgjO+MEVS+maCbF+vJvas64UDsezkmQtWx5XJKGiH3RlorYYa1oa6DH
	xNFKxuHgeoDLObgtFftdeOrIWvJpEk8N90qaM=
X-Received: by 2002:ac8:5a0d:0:b0:509:379b:d48 with SMTP id d75a77b69052e-50b14746739mr78317031cf.9.1773898964678;
        Wed, 18 Mar 2026 22:42:44 -0700 (PDT)
X-Received: by 2002:ac8:5a0d:0:b0:509:379b:d48 with SMTP id d75a77b69052e-50b14746739mr78316801cf.9.1773898964288;
        Wed, 18 Mar 2026 22:42:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7b7a8sm1003914e87.80.2026.03.18.22.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:42:42 -0700 (PDT)
Date: Thu, 19 Mar 2026 07:42:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v1] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
Message-ID: <whqo7o6fu6mytf3hpdrrirptx3fpprnp25as3dnam6n4fo7tjq@dolksuaq4irz>
References: <20260319031040.4096297-1-shuai.zhang@oss.qualcomm.com>
 <mcjloavd6jhinb2wgfwihsdtbay5n7zv52tn63kzrabcqwyp26@mh5aet76kl7t>
 <1603a5b0-8edd-4c31-b2d1-344ee7df10ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1603a5b0-8edd-4c31-b2d1-344ee7df10ac@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0MiBTYWx0ZWRfXwJKNqs8JHpyv
 Lkg/E94PfGQz5eId031G0ZNkTNw13O6RwNCVTjmKia1KvvRKaa1JvMT8f3Kchvq9MeoMWP49tp9
 FZl8yS5pGa76SZ+phQr+s1qW7ODrTrgDcaGd96NfMgQ1bOLXZJ7RzXHrBkvaG9ki2UUFLZI6Gw6
 ncBJ3VQ3AbWj8WTTgw8izbl9WOxpvUoPMjOj4/kX43YP3ulbHtV/aC0w2HARNgQ0Li3ATzYbI5p
 ddj3nBpDHOM59yxQ/6rAoHPbfYPkBKVhex1bzMIDU2Fy09GABVBl73jkyuxQ3cE1ari1//UGb4V
 OgJgk67kw5L91Yz2U8rUexf/OSwawYdhkltYb6sv2irxNzQFwzegzJSB2OQXW0ecMIhgOsb9zgs
 PF+GloGuA0mFztkmzFDNu9Sbdowy02U4pEEhUlXZ3SkVCcU2/NJNJR1qGLBHWA5+ttS71XA/2hW
 O/hwvf5AUuLQN9fin6w==
X-Proofpoint-GUID: 6CVz_-Peam98fhhNvUf-mImUlCddjHBs
X-Proofpoint-ORIG-GUID: 6CVz_-Peam98fhhNvUf-mImUlCddjHBs
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bb8cd5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=M9_Ot2h7v_1VYoE6DvQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190042
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98624-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.962];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E9022C64AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 01:21:58PM +0800, Shuai Zhang wrote:
> Hi  Dmitry
> 
> On 3/19/2026 11:51 AM, Dmitry Baryshkov wrote:
> > On Thu, Mar 19, 2026 at 11:10:40AM +0800, Shuai Zhang wrote:
> > > For platforms where the bt_en GPIO is not defined, software-based power
> > > control should be disabled when power is managed by hardware.
> > What does it mean for this chip, managing the power in hardware?
> 
> bt_en is pulled high by hardware,

In which cases is it applicable?

> or described in the device tree as a
> regular always-on GPIO.

Why?

> 
> 
> > > Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
> > > cleared when bt_en is absent, aligning its behavior with WCN6750 and
> > > WCN6855.
> > > 
> > > Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> > > ---
> > >   drivers/bluetooth/hci_qca.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > > index c17a462aef55..4512ff7cd0c0 100644
> > > --- a/drivers/bluetooth/hci_qca.c
> > > +++ b/drivers/bluetooth/hci_qca.c
> > > @@ -2484,7 +2484,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> > >   		if (!qcadev->bt_en &&
> > >   		    (data->soc_type == QCA_WCN6750 ||
> > > -		     data->soc_type == QCA_WCN6855))
> > > +		     data->soc_type == QCA_WCN6855 ||
> > > +		     data->soc_type == QCA_WCN7850))
> > >   			power_ctrl_enabled = false;
> > >   		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
> > > -- 
> > > 2.34.1
> > > 

-- 
With best wishes
Dmitry

