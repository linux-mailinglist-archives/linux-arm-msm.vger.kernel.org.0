Return-Path: <linux-arm-msm+bounces-103885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBcKO18V52ne3gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 08:12:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 497AF436C19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 08:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D14AC300DF63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EA437F8CC;
	Tue, 21 Apr 2026 06:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ss0fIIkU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HoTh6xIz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D013837F749
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751813; cv=none; b=Hu5+DPV9j+noNK1/qZncGt1Rw8HhOQrMdM9tF5LloyzkfiBapFtj3U7EZ6FnyH/orIiyUgA+3KesU5/9vymYTkMHn/5Rcck9x70o6+JeBt9CpBtSBKCSso5Uv4qzUEX6AOe/0916rSmibVaTjmcyTMQhjVxl8EUCy0GbnwYctmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751813; c=relaxed/simple;
	bh=DU09t4e01tb2Dg5oxA0hYoS2Sw4H3Q/MxB4hZIBL86c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQkCMA+Oq6N6I67Y/dPQjgwV2vvv8lj2KpoNB7UK+B187I2gTfVwYJP7ffhIW3q6fzV5fsJdFXJQYkBfzjgQ9mIdH6JbVkt3JraD40hIJ5KA2ANp1vzhEZt9F6Z4xbn0/3aV4GLAXyw1LaY9oBIXIUxGRualk3P2O8HOMwgaMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ss0fIIkU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HoTh6xIz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L64Rrp3257258
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1guwVUsMIMD/Wpv/IcScqQdd
	RIpEXoJdanKvBpB1ZJ0=; b=Ss0fIIkU1dxb5Xy/z/S+TipJ0qapF+MW2z9RlxuI
	seJUYFSYlo7RfNQIndELCdlXAo1Yd9KlKN58BlvPXYli0tHPDRUnU0j6tz1JMRDB
	qZvE1oDA9TTDSum0vF6ztWcUdvSSFEHahRBX0eVMV38DUk41RhLEVOYJz6iqxU+y
	WBHh7ytR25fEZZYhI4bpvYJxJr6ueOhVxwqE9qK5841XW/tBqVwUQQR+ob2A1gsR
	ew66n2e2nNYC5JWPni11CRrl4u99iZClicgK7oKxD3UM6PD4+wQSR3bKVwYMZrHd
	WFQOVVY/rcvr63ZaGTSQ7mtU3V72eVjC0OI1p9lmpNbBIw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3na80ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:10:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f0e12d375so2308016b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776751809; x=1777356609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1guwVUsMIMD/Wpv/IcScqQddRIpEXoJdanKvBpB1ZJ0=;
        b=HoTh6xIzU+PY3PFl4uRB8bNpBPi14JgiJBAjtW1Sq6olO1E40VDkSnurgBtuHZyPa8
         1tWzQz6wxFgUh9x5Wbs05GnC6+UGowrWgvcGqQ/cAz1NvmYobOUriYEI1kHlkDUQXigj
         efIVgXpu75k8aSAmgZ08Q5UY6aGGN9dOT0IRSmCZk7xQwoWCzIIsme4pOjtC2/i2crdR
         bq9BWrsEixQOmh5aqEQkVedmKYNe1GOCG1CchMPAo0Ztg0DwPuzeRvRBLMz66S5WyQOz
         K9pxvhMCR/rEazMuhX3QI4Lc8FARcoHhYjKqyKHuTWFwMob0wZAT5Ab3L2gTr0PVfamM
         DrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776751809; x=1777356609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1guwVUsMIMD/Wpv/IcScqQddRIpEXoJdanKvBpB1ZJ0=;
        b=ZQlfxRLmjJ/CAtJFkQ5qayDXdgu5qTCnGVbsEXSFXlHRKf/tCpBqjv7J4qkmdZKaYM
         BA7wdTPGVNP/cQQqveL3udr/usXUTbLNorsQWBWuxGkkN6sHFhEbZsaldvu1zEiRlRgL
         RRX7u3s2B1iY2n9ytFz3kQVu21WCmkfDnriKhaTdb9PIPn52G6jxHelfipe4iNzDcp8j
         TvZWdWF3pJjElb1Wamj049wXIJLgkh6ePL1cVPlmiOSHnqld/W29SXs4juDpopdc8wGW
         gELIKEZWzuJu8AYULLQvLyZh+sC6xQcA7ZhVLmyTdA6CvL8Tl0uAUko9cpBi3zN/n99Z
         F71Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Y2p425eg8+xpsgAnIWWQH4wDC8+NUALUVpM+XnneyyoyOd66eoZJBkUuBGmevKm73w2IfXEhcmipId2iV@vger.kernel.org
X-Gm-Message-State: AOJu0YzB6Tku5PJ95sI2cqluagmluYidOWxH+FZSwX8GSv5lBRelUpG2
	YDckMUlgzx6E4bLerq5I13wetRLfMpY6Zu9zCrA39ybvYc92f7Xk1RGBLd+EPwT+kR6KvZw3OAS
	YEd5LoIkXW0oRkjAZhrupAw6IIrUiYbHTLvW5x5u9hDpQtNea6YGApTT63Q06kTn6U7jf
X-Gm-Gg: AeBDievElIuCWHx2Glrf2CosIb6M/kbWa2JlC1aPQQRPLVWpvCJ7fgXWA4NwtePHTRL
	HVYH8Nb9j9rxQ5ptvn4XHSSLBNCTiTr7K3VdP72QY/GIxHMVxU75eirMJTg5ZbP6XrnQtNsy2Ko
	iSSVvAsZ6Ps/fDQAdybnEpyA8KI2zQ3OfDn+FacQTxQimEqs0r5qkszGD7D32/kL+CSo2ICfjbc
	aQnpcfjN7nShZ6FmHIiopohVRruZtKhyhPONa7eptRb7J5QVem/eZ0RnoPdORm4vLR8GyG8XYK3
	rIFn+BbJ4Bb7kBrDW15df11dToVDBXvps3d3YxjJkMEhGtHLRcAaRu3S82voWpKWTDdDYvBz4FQ
	3rTBRpEvaQZ+L3nvlkIiG+DjF13ynbK/14/xxAst1qEOybMYNwVDZU/BC7dVkM844BeyzUg==
X-Received: by 2002:a05:6a00:1c9e:b0:82f:6b6f:13ec with SMTP id d2e1a72fcca58-82f8c9427b4mr15422847b3a.34.1776751809487;
        Mon, 20 Apr 2026 23:10:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c9e:b0:82f:6b6f:13ec with SMTP id d2e1a72fcca58-82f8c9427b4mr15422812b3a.34.1776751808982;
        Mon, 20 Apr 2026 23:10:08 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm13905438b3a.47.2026.04.20.23.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 23:10:08 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:40:00 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/5] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
Message-ID: <aecUuK5nF/hjV8tX@hu-arakshit-hyd.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-3-ca1129798606@oss.qualcomm.com>
 <a432b2c2-475e-4833-9225-801990cb2d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a432b2c2-475e-4833-9225-801990cb2d34@oss.qualcomm.com>
X-Proofpoint-GUID: OUbBtVyWOlITpRET36Z0CI71bJ0QXEp2
X-Proofpoint-ORIG-GUID: OUbBtVyWOlITpRET36Z0CI71bJ0QXEp2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1NyBTYWx0ZWRfX6ttHBwLm+r/O
 bSehZhNpPGElJc7jqBtJFSW202WfuljYnndpmHwPAW9qA6oens6UnLhgmeOwfyXQY9FjufPsgzX
 ydOoS1RozfEzeMfueGI4HEpm2U8f/gmMHipowH06lFjDPvkghVG/LClwZQMGAU6+3rcbPyEQoxJ
 jvHBwu1y/WaWjwvgqo7LtG2+0oNSqlQ6hLyajHk/6zJVRs/OGd/RX6FeVlLaEruu2fhM85b8J4A
 fDCvU7Ik/iUJOSnwOmW8ozD3o2wBCeR1r3L2eNSKbW/xMTQu6SFGL4ZH/VsKAdpf2E/DRPH4VDY
 zhHOJZOT2wn8uMcUcSYEVjy2jYiMqkkV2qwSsZnmmZbyrIFpLPZLgGJHjiEiCRF6s63xr5wmGnd
 SszvJNLwED6Z6eq92mLE7q8avxgm+CL0MpEOCFeJhOxKMl59RKCDfewnkbna0qDG44rq1lwHBGO
 wkjoJF6OH3gStVLHcgg==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e714c2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ciROkYvXyXDSqN8Q_VUA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210057
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103885-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-arakshit-hyd.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 497AF436C19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 06:59:42PM +0530, Harshal Dev wrote:
> 
> 
> On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> > MMC controller lacks a clock scaling mechanism, unlike the UFS
> > controller. By default, the MMC controller is set to TURBO mode
> > during probe, but the ICE clock remains at XO frequency,
> > leading to read/write performance degradation on eMMC.
> > 
> > To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
> > to align it with the controller clock. This ensures consistent
> > performance and avoids mismatches between the controller
> > and ICE clock frequencies.
> > 
> > For platforms where ICE is represented as a separate device,
> > use the OPP framework to vote for TURBO mode, maintaining
> > proper voltage and power domain constraints.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> 
> [...]
> 
> >  
> >  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
> > +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
> > +				   bool round_ceil); /* forward decl */
> >  
> >  static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
> >  			      struct cqhci_host *cq_host)
> > @@ -1964,6 +1966,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
> >  	}
> >  
> >  	mmc->caps2 |= MMC_CAP2_CRYPTO;
> > +
> > +	err = sdhci_msm_ice_scale_clk(msm_host, INT_MAX, false);
> 
> The 2nd parameter is an unsigned long, do you really want to pass INT_MAX here? I would go with
> UINT_MAX. But still, why go with such a high value? Do we not have an upper bound for the clk
> frequency that we know we can't ever exceed for any target across OPP tables? If not, then maybe
> UINT_MAX is best we can do here.

Ack.
The scaling functions along with the OPP-helpers clamps the requested frequency to the
maximum supported rate based on the clock/OPP table, so any sufficiently large value serves
the purpose here.
Frequencies are better represented as unsigned long values hence, will update it with
something ULONG_MAX in the next patchset.

Abhinaba Rakshit

