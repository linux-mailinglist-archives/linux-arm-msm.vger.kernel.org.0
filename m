Return-Path: <linux-arm-msm+bounces-100770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMdJFkBaymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:10:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFCE359FF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFA3C30C0511
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D310A3C5DB1;
	Mon, 30 Mar 2026 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kw75iW8f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgUKmmgj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3553C2772
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868515; cv=none; b=a0h3KMXPcB8eEIpfxMcCX3KPE+9RZYIcguPlNwKQLG2gIrGCIIqQTb7Q3Zsqq0iKb4hIGpvakKg/T81HZJNTnE+h1f9am192bCxNl2heJvYvrfiBOz5wYru6Rw2QBw/SrWMExAgRHAwEuIXvb6n26/ro0g9Awcy3LLFrBZAKgSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868515; c=relaxed/simple;
	bh=JhX5rtqRn0zw887+TlMkThcQSYcYMgZwqDsQkvLSQQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kr4W6MniVaJsNn74aDoIyVCsTCVfTksFSPFG4LANmOjTRcikMJr63QK/92wpO1St/Nie/0zeDVHc/agHTyXeTSifCfhOyfgE464Ua6r6EmA5E8siQrIL7dt1OILLE0CFfeTNhc1KOf/eBcfFcZyW81jwzWsGuonYluN6rk4lGy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kw75iW8f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgUKmmgj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA7ce93539570
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OcrOxpagqgIZFiiEbE/bG/+W
	/OFVReH6QhEatRKtg5I=; b=Kw75iW8fCfnQhqX0NBuVd4sl0KI/SLH6N88LUizx
	LmESFnUunZdwEZqset173cQ9YPw2uIka5/cOZPPqRhTAuv0kLTTmxMg6Z4OKz7NJ
	qb/dArHEcGU02gwRLVttX2QmuK/il80202xLGeKpUpF9z918bUSc2Wx7K/xxxz+U
	yBdGkKEKX8pYH44dmdjY6Lp9xwdsOqdw3eDFrtAOwQI/G3bkvEOJ4Q8lMOLIflFE
	0WelgXbNqPLyLIkdLCeFUfaT1jg8DOlNGs3X3r+HOrMiRaiAWThJK2HRD4Oitt2Q
	nozqbI/P1b9KUR9GdRrxsIVlseFAGImporKDnKwoI/nsEw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59r65p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:01:50 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56b7482a2easo2733298e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774868509; x=1775473309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OcrOxpagqgIZFiiEbE/bG/+W/OFVReH6QhEatRKtg5I=;
        b=IgUKmmgjEh9amFnoB/IlI7cTJL3bwsv1vxgVP64KgaQqcvDzzawf8dnbV5rVuqhpT+
         MaZYFCCNox3B5zi/TjPXnBjp8OR0uUQu+gRLuiTlLmARYWOBfeGTVk2KDIovbERL3EqQ
         HUORgXucu55cnGuWkYasy+XWo2jTIhd0tqoOjPWlwy+2yiWoXSYJg16f7ly9qpGkPoLh
         bKPg8YNAgDa1xNxy3tXFMapQQjGHw92DAQqMjLK1wFSA9w7dvWVZxUFia1hsvS4GczXS
         EVsvUzA6AaJ/IUZ5kao9OcI3vBngsyNKmyWcpO8TZ1VpP1CDZ4LGmWSwlgiDbUOprr0v
         MkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868509; x=1775473309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcrOxpagqgIZFiiEbE/bG/+W/OFVReH6QhEatRKtg5I=;
        b=M3Acf8TmomFKaam+nxjMt4k+nGYR8p6rKxu+F3AHydTIzqTdp7vycMfPc1WKGP/Peo
         u/th/yvNbaz4spjcCkQr+e9uAqbbMEE+LCPvW2VCEtJc3Vfh7nzP2FSQNowI4ppfLU9I
         +hOSaGlUo7sjfNJhkGB3w4DZx3NhxS1DRtdm+2HyVX7wuEhgR7AE8CCdcTWmGUGi1n14
         wmR0Fh4S6MxMDRCqNXP6u/E9Dj/bWjbviKZ5JVeORgwukG39XisOnXNnyQXo8JOnOAKO
         2DO6E497BUv4FFsMXNmO8UedqfIWPu6NT6A+qecZzN43RaIYZA4OUgRanyk03hk6l7VR
         IfYg==
X-Forwarded-Encrypted: i=1; AJvYcCVZJY9nnk1hHbb7++A/09UKs0JnDUT/wYnpGdtPrLN8lCPuS8rQWheR70ipK5RSqBpYqZBMemdaQSx9+phk@vger.kernel.org
X-Gm-Message-State: AOJu0YxtpNkCDOTOfD08UQUmRixnaFK/tgFZpqnTkh2wP7gzshGdQXyt
	QwaXE4ftKQfUnDzYEP8M4ngAUR/sfyEiMEcJ9Yafqcm77pIRMaYQPEo5gU2ox91pl0YZhovExzD
	G3Lf6fFdqPK8yNEFNvjro+YcgFc7atFRVyr8Gh4j/yTCU74cJmt17SotswH8AEhFAHoJB
X-Gm-Gg: ATEYQzz4y5jclM4y9fhJATjhXR30raOFGSFYmribCqAcNdvs11ctuW3mymtnkbnaD4J
	6KDI0HHV1Sostz/bUfDM0HJnG0oqzLrRq1GGVIB45ch+tGGYJydzYG7WyVrAemrWlzxbQaKgYdb
	u6nhXIk0SMsldnbXPNaGp3ERcTiI6ToBFIbjLVkhlm/z5pTsSb13C5Ko+K1WTOmp9iHqCOuZc9P
	p8UigLaSHRtOhcvdUTmrgYZBzdEmhkrbf0B4vro4ZBfs6uAFDyFXQu2Pb6nyKvbrSjnx1BuAxIp
	i6mx0VbH2ydZ5hdA2Gy3DHYv3OQa0iiYerVxq1aL7ziXPNMBtJEcnw4z6YrWcTyRFGNa2LjMe+a
	mqCcx5a+HaQBcShydawpe8JdQcUB6P913pENY9M2H3jybu7GmrBVrdatWthaSuVMfeb7+aNf5+1
	SMF9CdlozvmnApQwZea3Gy5y6tuVHsZGqo07o=
X-Received: by 2002:a05:6122:2517:b0:55f:c318:1afa with SMTP id 71dfb90a1353d-56d4a52942fmr4219739e0c.6.1774868508944;
        Mon, 30 Mar 2026 04:01:48 -0700 (PDT)
X-Received: by 2002:a05:6122:2517:b0:55f:c318:1afa with SMTP id 71dfb90a1353d-56d4a52942fmr4219656e0c.6.1774868508449;
        Mon, 30 Mar 2026 04:01:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403cb6sm1576295e87.27.2026.03.30.04.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:01:47 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:01:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanpaali: Add USB support for
 QRD platform
Message-ID: <bpujn5bccpbljrosebos4hspddtzoyq5n5mw7ybzffqtj24rmv@tcmedafm5lai>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-4-krishna.kurapati@oss.qualcomm.com>
 <qycxxxlt3koyt7snnwpkmpo2udskhad3l5vjpj3mpdi5qyoriy@akxv27lrpi3n>
 <eacea84c-ce3a-41eb-835c-7da55d130d88@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eacea84c-ce3a-41eb-835c-7da55d130d88@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7KdcLIsjXoCM-s2ETYAdxCk3DfEptOpt
X-Proofpoint-GUID: 7KdcLIsjXoCM-s2ETYAdxCk3DfEptOpt
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69ca581e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=HZZgv3tumfGS_1V8ACwA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NiBTYWx0ZWRfX5/OYOgj+K4I2
 KfsK9E4HsLD4hOv9Wb00uv3pq9oCEQQJz/4OhwWKCiWzbbWnTLd9ROWWjp04W2Xue8VDzck3dTv
 2aKWz/uSk6aXdpG1mSnfoaMnLQO9N6hmWNGuO390IpF60aGIBA2G1h+htvENixyFJZi16XwAtvi
 BVUk/2SXQBzo51DA4LbIVqGsBtUQnSEUD+MwVZqxt33eYRkvtZxtmLUNX3HjzmNrERTcbS2QrVm
 eXzDlYiRrrSmO1dKaWUCzcAq7ZhgPBaD3Nzesb+DNZkscZ1nnN4aT9uxYojKJThuzmzos0WrYZK
 k8NayZszn4ezrN6ut/25cTGGhI7XIVq278bmZwvuIW5IESJquXRQsv2+JyTLDmc8DOnU5bwTz0b
 72x+0uiUCdJBXntaY/EFowf3u+4iKNXJw5gdC4zv1zOT63loKkx5NWMIfToFnlTdd/nvP2uEJsP
 wIjudXbN6NeeYkBtsmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300086
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100770-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDFCE359FF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 11:45:48PM +0530, Krishna Kurapati wrote:
> 
> 
> On 3/29/2026 11:37 PM, Dmitry Baryshkov wrote:
> > On Sun, Mar 29, 2026 at 11:22:49PM +0530, Krishna Kurapati wrote:
> > > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > 
> > > Enable USB support on Kaanapali QRD variant. Enable USB controller in
> > > device mode till glink node is added.
> > 
> > Why can't it be added as a part of this patchset?
> > 
> 
> Hi Dmitry,
> 
>  SoCCP changes are not yet acked. Hence I wanted to get the base changes in.

=> commit message or cover letter, please.

> 
> Regards,
> Krishna,
> 
> > > 
> > > Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 27 ++++++++++++++++++++++
> > >   1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> > > index 6a7eb7f4050a..1929ea273a4f 100644
> > > --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> > > +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> > > @@ -80,6 +80,11 @@ key-volume-up {
> > >   			wakeup-source;
> > >   		};
> > >   	};
> > > +
> > > +	pmih0108_e1_eusb2_repeater {
> > > +		vdd18-supply = <&vreg_l15b_1p8>;
> > > +		vdd3-supply = <&vreg_l5b_3p1>;
> > > +	};
> > >   };
> > >   &apps_rsc {
> > > @@ -821,3 +826,25 @@ &ufs_mem_phy {
> > >   	status = "okay";
> > >   };
> > > +
> > > +&usb {
> > > +	dr_mode = "peripheral";
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_hsphy {
> > > +	vdd-supply = <&vreg_l4f_0p8>;
> > > +	vdda12-supply = <&vreg_l1d_1p2>;
> > > +
> > > +	phys = <&pmih0108_e1_eusb2_repeater>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_dp_qmpphy {
> > > +	vdda-phy-supply = <&vreg_l1d_1p2>;
> > > +	vdda-pll-supply = <&vreg_l4f_0p8>;
> > > +
> > > +	status = "okay";
> > > +};
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

