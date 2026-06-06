Return-Path: <linux-arm-msm+bounces-111497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Eo/qFAkPJGrS2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:14:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BDA64D561
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:14:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nlVCOqnv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KrYC61sU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111497-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111497-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E95330166D1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122123845A6;
	Sat,  6 Jun 2026 12:13:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C9D23BD1B
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:13:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748017; cv=none; b=ZnNs6y26F50cm0+rKyJPrlXpsV3gF/LhKPEquxmJDmjiZAv1kXKw13uERcobkbEA3eLBdGOuwTLmuq58mzTLDD17PZr0wW7rSaZDnp6qgliIXUwMCNZ6vere/Im89jpdvlNC5JIkXZaPbnkecHl8+EkK99j1/93zdYNIyHXB9IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748017; c=relaxed/simple;
	bh=wZKSA5a9f2Sovn4xLrrhWJwAYYgvMB2xCPCl1W5rkGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAnmCRzjrv+OlakE6EFoEAkAFjNwoOTM7cL7Vwf54ECmsV5GxSXBFP438dRNsRLWSs4SvrqjgPfRKkXcUq0+falmIxPI55D31GFgj2SSoEGGg9oidG7pP/AXz0euHFO/hTidgtxIqBE0e2DNBAYS+2bTJUrCa3liKJJsU583eKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlVCOqnv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrYC61sU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BJ2GA1300094
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7SqtGoBVXuWmBmxq+hyY5Aee
	WbM95T5UuiKyeUwR3/I=; b=nlVCOqnvI9dHtCJhpU6XQbAxyVBFHxyqOtS3JuvI
	rkARy5cPLRffcwuHgYNaMS6xu+CdLUfa0acd6SWVE+qiLP1UMRVqx8g1E7ntTs8f
	99jmN4IiYBOIo23znWntO6wRixUgGKJmzc+OACjiiEKCix0YBh5pj58P76SSa0wx
	1+F6tEGouLiTpaJQesrbCXBVDfrfchaCxsZ/4A0/oo846MDDWEzFBRRYaZFMJiNy
	45yZZtiwF0n5yo+IOV/XhVG8oaMxUOHqrHjPzHCyBVdzdH9scRA2Ys2wZBFRb5MV
	CjYBn25wl+UY17Q3Tr8tdjtaWyvUXRBv9cMVJymKNhOWuA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3he78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:13:35 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso1418971241.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748014; x=1781352814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SqtGoBVXuWmBmxq+hyY5AeeWbM95T5UuiKyeUwR3/I=;
        b=KrYC61sUAf3l/oRXC1OdJws9ZUGIIldZGBhCsAhZxwKGvts6WgOMHoJ2Z9IQOdATY6
         bus1EKxmuaubY7pU0l41lYta2PeRlSrFZ04dkD3Lsx1ay8zhKlZHIczfJoDvPHBQJYDt
         gXVqM1ojze91BsqT1fhilQ/7y6PQtvaCIDg7xUqGJk+yECzpn8ximAT8S9xYIUvHQ0iC
         t2nkme1p0Gd8SPLz4WrQwAKWGiQOwVowU9SpJv8eA9za7aXAd/q7Yds0diGMsO7it58w
         sgWQVTPqPuqMGhkYbGQ9/tsJDC4o27P+JTTbjZw5szD+GIadUEGU9PT5P9bvH8VnOleT
         AyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748014; x=1781352814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SqtGoBVXuWmBmxq+hyY5AeeWbM95T5UuiKyeUwR3/I=;
        b=H9V+5zMG01zvlsGwKhCQXsbz8gKPPGMUAQsmzMXW0JahCXOKeMgFG4IofczcYKGne5
         HXH1mnTEbf/9mM50E32t/DNcLDfB1XJd2onlAPhkwIAGkA0QRE5GU8PTjM3KiB0JYBj+
         YENrMZZiSaT22c6u3K3pVosVmCJPNlOiCjRQVdU5WCWt1TdzFux2eKzFUTRHxWM6gVK9
         mnjizm/Y3IIzs2ZyvysDebhlEPSjK5n7MDdTqmC/nvJvZqQu+1uifzBc7jWacoUYEnV1
         Texa/TMf6r4xnwewRh1dHtxscmf+wV5hes5md0WVN0rIUpf/THjf4ei9zsk54IAWQpg/
         4Jrw==
X-Forwarded-Encrypted: i=1; AFNElJ8gJ2lyEe+jGd8U8SkIvXe+IDz5O7isSBLWqSl6xp2rJSCUYPZufbzZps2vtKMzTOV67u2UEYUhm4a85PFy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+kfXmNW0oAKFKi8k31jtNSm9oZ+Zg1tjmKPzjxIG7NJ8Y0sCv
	068u2hX1HS0MH2KMKv0AoKzV+w3v39Am17FjQ5DO2yCb/KgrdhPaYH+bhIdBlooPaNquMs/4sEo
	bfN832gsrP3aGOR1TqJfGz47z2nPXNqeAtG30KWqUw7zagaF+Ytimk5jhOF90uUpbrY20
X-Gm-Gg: Acq92OGDfUoHuj3mIgtyaXZ/G3t0sChBGrUjxsLkMDX2caYpB/CWYdZAdmBQUNZtN7m
	jzkp+YcCIU2vJ9uCT/XePhj/6BpN2SCwm7r001o18B6YZPY63soc9dZgbBGbZUPuQ7or9OGs3F8
	BLl5PUawE73GNYs93oEgWqwqZaOBcPeZEnmCYbW+9stvjt2s6BZReGs0jjmOxgVl2XS9fDB6+QC
	SU4zMaMiKXh8FToHnihGGhSNT3zXlzC7AANWBEgucbReXGVfpf1JRYNwAt1TkmJqYnqj6pJpasg
	Jipe/6ORQLt5C+mSRahcu8srn5iH3ZK+mznHSx81Fs+MDC3+N7fP4kD8VJOW0vz6+IB1gDAcXWi
	TxszTKR9S7RTTdvIL9VssgmcvAVRuuWiVTvs6ML8siUYZG3LgmPzlqXPPy6xi9iS8zI969gdISv
	prOJjUqEG7ELW0AbAosiaq0MNlHE0uAFFuoM1yVjpBcIM6Gg==
X-Received: by 2002:a05:6102:148e:b0:6a2:b441:e0e5 with SMTP id ada2fe7eead31-6fef20ffc89mr3999897137.8.1780748014370;
        Sat, 06 Jun 2026 05:13:34 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:6a2:b441:e0e5 with SMTP id ada2fe7eead31-6fef20ffc89mr3999874137.8.1780748013932;
        Sat, 06 Jun 2026 05:13:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66ea9sm30824371fa.2.2026.06.06.05.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:13:32 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:13:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        rajeevny@qti.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Message-ID: <aiQO6RdkqVnBuzp6@umbar.lan>
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <20260519-curly-courageous-sturgeon-2facfe@quoll>
 <dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com>
 <yn7rwuguaqliovlyukcj2olxby7zerv57na3jf2pgbke5zgahk@aasd4ojwdy2u>
 <a5313752-17ef-4d00-9f61-7717e4f06982@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5313752-17ef-4d00-9f61-7717e4f06982@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyMiBTYWx0ZWRfXzQEgFQENkOJR
 IbAmvITZHj95ogdS0V83Y1lOtDPtUfEgCBU7g/GcvvE1iUDatXcQF8STWOxTg+fZZ6Jv6NwCBky
 zrOhSnRx6+YOfaTpe4g/QI9tWBW43rYKLTMF8JPHnRwAYypWgrBuTx7HRFth/c6dqaig8LF9p2X
 tmRKDvo7cqKjnaQWhXh7Adds9eSJ47cyWBwFvLV1C4b+C22dMKAFI50nVN/u/eV5nJRU4Qz80A8
 Jq/M9YUXv725G5OBwT6s7NtQszgrcBn7ERwQkw03wVWyDacSrEyDcO+cHMQ1wBdpNf9TeleAhSK
 MTpFAGl5l/OeEr5MDRN4uirgblRXjyVAV/kh18a65K5jX2GaRq3O1dcScCDeOaLCsVmmvFApWyt
 6NjbK20Ido75f9LhZsgi6LzQ2elMot6EQIbriN3rp54SYMxU3taHLG5vUjQv+y394p2HzM1ErZu
 d3XcpIfP4zxjmP43Dpw==
X-Proofpoint-ORIG-GUID: QukqzsprLZSMGdqyeIRgZGnAtmwe1hp_
X-Proofpoint-GUID: QukqzsprLZSMGdqyeIRgZGnAtmwe1hp_
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a240eef cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=IV4c8OSHAAAA:8
 a=t1hzSAPpwDwDAyt0_CQA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=Q6n48rkgcAvIKCAITAMI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111497-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:arpit.saini@oss.qualcomm.com,m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ayushi.makhija@oss.qualcomm.com,m:rajeevny@qti.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,umbar.lan:mid,yun300.cn:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5BDA64D561

On Tue, May 26, 2026 at 04:02:45PM +0530, Arpit Saini wrote:
> Hi Krzysztof , Dmitry
> 
> On 5/20/2026 6:56 PM, Dmitry Baryshkov wrote:
> > On Wed, May 20, 2026 at 06:10:57PM +0530, Arpit Saini wrote:
> > > Hi Krzysztof , Dmitry
> > > 
> > > On 5/19/2026 4:02 PM, Krzysztof Kozlowski wrote:
> > > > On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
> > > > > ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
> > > > > The DLC DLC0697 1080x1920 LCD panel is based on this controller.
> > 
> > I can't find this panel on the DLC website. Do you have a pointer to the
> > product page?
> > 
> https://v4.cecdn.yun300.cn/100001_2012175013/DLC0697AAL21MF-1.pdf

"Invalid referrer"

> > > > > 
> > > > > The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
> > > > 
> > > > If panel requires it, so should the binding.
> > > > 
> > > Ack, I will update.
> > > > ...
> > > > 
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +    description: DSI virtual channel
> > > > > +
> > > > > +  reset-gpios: true
> > > > > +
> > > > > +  backlight-en-gpios:
> > > > > +    description: Backlight enable GPIO (active high)
> > > > 
> > > > What is the name of the pin in ili7807s device?
> > > > 
> > > Display daughter card has WLED driver as well as LCD bias driver.
> > 
> > What is the display daughter card here? Is it a Qualcomm board or is it
> > a part of the panel?
> > 
> > Also you wrote a lot of text, but you didn't really answer either of the
> > quesitons. Is there a GPIO on the panel connector that enables the
> > backlight? If not, this is some external supply on your (assumingly)
> > daughter card. And it should be modelled accordingly.

Still unanswered.

> > 
> > > 
> > > The WLED driver's Enable is coming from WLED_P1_EN and PWM is coming from
> > > LCD_CABC output of the panel.
> > > 
> > > DISPLAY0_BACKLIGHT_ENABLE (GPIO 91) of ITP baseband card ==> WLED_P1_EN of
> > > Display Daughter Card (DC)
> > > 
> > > In the display daughter card of Shikra ITP platform, we are not using the
> > > external PWM for WLED driver. But connected the CABC output of the panel to
> > > the WLED driver. Backlight update is happening using MIPI DCS command which
> > > is driving the CABC output (i.e., PWM for WLED).
> > > 
> > > Because of above HW configuration, we need to enable the MIPI DCS brightness
> > > update on this panel. The below command of dlc0697_init_sequence() is
> > > enabling this.
> > > mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
> > 
> > So, this should be then dependent on the presence of the backlight in
> > the DT. Either it is a panel-internal one, or an external one.
> > 
> > > 
> > > 
> > > After checking this, I realized that this panel can be used without the DCS
> > > backlight as well when it's using PWM based backlight control.
> > > 
> > > I can add `has_dcs_backlight`  in panel_desc and set it true for dlc0697. I
> > > will update bindings and add backlight as optional property.
> > 
> > Why? Use backlight property instead. It's already there. Anyway, you
> > really, really need to describe the panel in the bidings. Not your
> > daughter card.
> > 
> This `has_dcs_backlight` in panel_desc will serves both the purpose, as for
> our current platform constraint , we need to create our own backlight.
> But this panel can be used without the DCS
> backlight as well when it's using PWM based backlight control.
> 
> So in this case I need to implement the backlight as implemented in
> panel-novatek-nt36523.c, panel-himax-hx83121a.c.
> 
> with this implementation ,I will remove the backlight from the dt-bindings.

Much easier. Call drm_panel_of_backlight() and if there is no error and
panel->backlight is still NULL, then create your own backlight device.

> 
> Please let me know,if I am missing something.
> 
> Thanks,
> Arpit
> 
> 

-- 
With best wishes
Dmitry

