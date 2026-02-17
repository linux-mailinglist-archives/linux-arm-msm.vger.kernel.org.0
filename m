Return-Path: <linux-arm-msm+bounces-93175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBqXIupnlGlFDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:06:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F70914C5FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47B0130457F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE16A3112C9;
	Tue, 17 Feb 2026 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7iZgtE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhlcVvh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F76DC13B
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333307; cv=none; b=cOlZJKg7er+46ae8jJweVVi3GfuEMruyVevF/lchDZmwKhCxQjKN+IniaG3Z1GHz6Pob8Pl4YLxKSHT3rzQ7OEro7wxvxfCO2ixXxxX4tdVUgMuFjMYeQZsByGkn1oLmm35ImpC0JI48aF72bRpJRRQnJF/ADz/XeU3/5MuqZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333307; c=relaxed/simple;
	bh=7dSQFmKwzJX/TICmtGeNRIBsnFI93g49Lw5UlHIdUYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puI4GlJslb0ptCJPWTNBAGcqQvTuYJleqw0DW38toi+pnpOk7u+bkJd9Hq+828yqHrvgiD7g2MY6J2HrjkHHrhB1kTZE63NrM5CKTm8zrLD5HeoERK+5bLXAqmFasHLrStr7DH1U++t14AuzacuqHErPocisQ+zwfsB6TsQ5hpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7iZgtE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhlcVvh/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBgm2X945797
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vd40U9UoMKaKOyH5ofv9FCYx
	5wx4j3wNJzQNQh0zjMU=; b=J7iZgtE2ZpPCTWhx4t8pBkb+a7TfdDBdSR+MhxqP
	gwQ/n+okZ1Svkspt9SgqyCsFjO5qRg1uVEL0tMP2bNTnXw1gitGivu6JC3MlcxD9
	ROeQfjnQqBNxcpYH+rcqX8pauHOl6qvepBnF7RNkRwLgnKelBetSRzE95eB551lG
	VQ1tb6osY+4WoBEchWYFdOMrZtBJDDPYvIwqHf4fvBfXwvYAHF4s87dHsO1skdmP
	PiMin1c9TK59Qql9QFzpYyt51lx1YNc6ejVnRMPBc9QdAFzKtjo9Z+nL55+e0FOX
	0LSel3MoTXNFe1yG/5Cb3+pPipXw8Vrsz7AOtprJpoPOyQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca361w29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:01:45 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-948b0f4b44aso4542043241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333305; x=1771938105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vd40U9UoMKaKOyH5ofv9FCYx5wx4j3wNJzQNQh0zjMU=;
        b=RhlcVvh/w02XG72CDz5OYkP4ICGqyNhXulIhqzpoJmHozQ4iWnM1EP6KQV+VQmj/Rn
         NXpqfnipYWbNpeBjSMn1jOiQRLa5m4Bx9l/6kHrX70MJsgGf1vmQm1CQR4qdW9q1gO3z
         /JbxdhlEy2Il21BhC4OUf1yI7tMQcC0hIFZBj8jIdnjE+/vMKRo4nIwpGb7oecU12ZwP
         OZ834UqhTqVRh53+yaNCD3KQtmTUQSZfBKP9X+1iIWIlCRbpuqNp3ahAZu6GsW7FaQii
         jg/dS8GvfL8eWMbSBjZrR7IKogOFa863114nLC985Ul7O0PiZRHfI0B8pJ0IwSVP3b5c
         awwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333305; x=1771938105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vd40U9UoMKaKOyH5ofv9FCYx5wx4j3wNJzQNQh0zjMU=;
        b=JbYhjbbt28cI+NBnKe4nze37M48/n8J86nMj6ZVGRqhlE29qRU6+XFmHrSxfoM+FcE
         z06f4vFWjdmel/hRXKCb6416KBxpXnxR0g3jKqEsxcBG3e5S2OXg+PeG7/88IqAi21/Z
         ZF5hn2w1BZ0ksMGQV25JEDw3FMe9OeqCGpRMDBqmqXmQMGYX5gZPmecBehiRhJ3o3eaY
         gGWKUli0Uj8+JJdlWOCg74CBHNVtOSVIjq4B3ZXayPLquI4Ryegnzra03A4A6ww3gDJH
         /BM6xkU6cCjXT88wB+gfyZZUb96NLWMmNOP3zQC60pPClpbcwySvHTc3ihRaD8MhjDOg
         1e9g==
X-Forwarded-Encrypted: i=1; AJvYcCW/gdKI2cygY+t9jazLJhA9xjMg3fq56SZCThHN6nZ3eEzGbDBffCzUOifiKKW1iOJX5dKxlP5SGJcgWIzu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz25NhbvN6GzSytJjhNkY1mSCvkbR9C5pq0EzeJ0W8JnnNRkoY+
	Jl/v7VplNzXUlkV8NujCxE2Obzq1ZsOSYJy1d3Z5CJI55SEqooYXGlKc73jI79CLaTOQDh04Mx1
	J5g+hoPd27sXI7ZRk/lzqPpiiqaIvbzfGzM+QEKuRZBhttqWnIzYamVWN9O8gSZwx+87C
X-Gm-Gg: AZuq6aIeou7Of6QrGTxLDCpfpAYHGkMfSkzmPSux7eUH7pNCeLnLcHUvWkCtlimG/yz
	5XKllmdHjLyfnjDRjGW8K5EvH4BVOjowkzxr9SlGDYrhKWY/pXBKLYHCC5hKPL4YurW7+iXAJ9P
	AfqpA5Kj10/LV9Ro2RDL3dqDT15XpyqKa2XckyG/ALcuuJ711h8TM/xTqq9Jl9ZqWHiB3cCdShN
	xBuQi81HPph771FVmqls2N2ew54QZOgucjhENZGHV/o9rqDd0nAl9iLZumMHV7E4apI59LtJwTp
	SvTpRlEkK9xVC90Uiufpfj3mNC6vuRyZXDEBzk7FK03yWAi/FRA6U8lg2agXHTw5I3lWUriFWwM
	O384e2/1WcNcIYbOjgr2c50tQ1N3sCq3CcX1COT8MfhBLI6kbljlA+dlCknaOhG64ID1UBcFCFI
	X87NaEJ2Mk6lJdGErAVruFiqGKrgb9Y0I+rWY=
X-Received: by 2002:a05:6102:ccf:b0:5f9:3a74:e17b with SMTP id ada2fe7eead31-5fe1ad01e29mr4127371137.13.1771333304674;
        Tue, 17 Feb 2026 05:01:44 -0800 (PST)
X-Received: by 2002:a05:6102:ccf:b0:5f9:3a74:e17b with SMTP id ada2fe7eead31-5fe1ad01e29mr4127293137.13.1771333304043;
        Tue, 17 Feb 2026 05:01:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3870689259dsm33693401fa.2.2026.02.17.05.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:01:43 -0800 (PST)
Date: Tue, 17 Feb 2026 15:01:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
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
Message-ID: <3v3iz5cxsbaoevcfkk7itutdepfuagxoemixgfhewdevmju2ut@rcg3zuyg4gzn>
References: <20260217054731.3058567-1-vivek.sahu@oss.qualcomm.com>
 <20260217054731.3058567-3-vivek.sahu@oss.qualcomm.com>
 <mt4vrzmq7caqddwtz7nc3tn33zxh7uupoxfmk5pfqobhuex43f@se64qz7qvuh6>
 <19d3cced-f630-4a6b-853e-3798487fd769@oss.qualcomm.com>
 <20260217-mighty-organic-oxpecker-2ed848@quoll>
 <cdbef8d2-df96-4a41-98eb-3acc747a0aaf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdbef8d2-df96-4a41-98eb-3acc747a0aaf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX+8AoF1LKSEpT
 qZK2bhZv2uxV+Q5abjtXC3lI6yXXZU81u+C8cH6CTPBx+dOSRSAntk0WRnlIZOkuPK1/kHBSPDs
 BpmY8x3pB6aoroIrCEDUDAwdN4ebi5bq3mGlGSub15rBXampzkCBaK/nDRxREFAe3LIxFFvFHSq
 OL+sqO/w/T2XZDgahFPjLS3ZZSXi3ErHlUHIwwtwCgERPKcyunmpNQM5tI1zklwA9VszMhRpZU6
 WMuQHYTb8KOFm/rS1ozEPDbj+wA+JH7en4oRCQiTZEDoWTI5vqaIuH2VxtN6v5EnIxBocq0onLx
 QYurwaMyZBAzjWYXpQFWWU7MZbV5nQxkt2XFvkuVzs7aWhfsV2RB4rqDIlVPqAoPfyS0PJnMK4b
 Q//ETrisWIibi2GNw8kFALASFMi/ExrT85pY7YbidBO1W0reR87dPsjnantbTxd8wGjt4xCBxvk
 E0KiRZacXuNh12DqyAw==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=699466b9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NK7YlZMuulUfQlmKRgAA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: uFgHt_670wCr2LDTIuqjwc9idNonmyXe
X-Proofpoint-ORIG-GUID: uFgHt_670wCr2LDTIuqjwc9idNonmyXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93175-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F70914C5FA
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 06:21:19PM +0530, Vivek Sahu wrote:
> 
> 
> On 2/17/2026 1:23 PM, Krzysztof Kozlowski wrote:
> > On Tue, Feb 17, 2026 at 01:17:29PM +0530, Vivek Sahu wrote:
> > > > > +		case QCA_QCC2072:
> > > > > +			snprintf(config.fwname, sizeof(config.fwname),
> > > > > +				 "qca/ornnv%02x.bin", rom_ver);
> > > > > +			break;
> > > > >    		case QCA_WCN3950:
> > > > >    			if (le32_to_cpu(ver.soc_id) == QCA_WCN3950_SOC_ID_T)
> > > > >    				variant = "t";
> > > > > diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> > > > > index 8f3c1b1c77b3..a175ac31e7b2 100644
> > > > > --- a/drivers/bluetooth/btqca.h
> > > > > +++ b/drivers/bluetooth/btqca.h
> > > > > @@ -158,6 +158,7 @@ enum qca_btsoc_type {
> > > > >    	QCA_WCN6750,
> > > > >    	QCA_WCN6855,
> > > > >    	QCA_WCN7850,
> > > > > +	QCA_QCC2072,
> > > > 
> > > > Why not keep it sorted?
> > > > 
> > > As mentioned in the cover letter "qca_btsoc_type" enum in
> > > drivers/bluetooth/btqca.h contains all the soc type which need to be enabled
> > > for BT enablement on the target device. There are few places where logic of
> > > framing packets transferring between SoC  and Host depends on the which
> > > generation of the chip it is, refer api "qca_read_soc_version". So It is not
> > > sorted in btqca.h file.
> > 
> > Neither in previous patch comments nor here you respond to actual
> > comment. You just write something completely irrelevant.
> > 
> > I don't think any of this should be considered if you are not
> > responding to actual comments.
> > 
> > 
> > Best regards,
> > Krzysztof
> > 
> There is high impact on the existing design if i make this enum sorted. We

What kind of "high impact"?

> are considering your comments regarding sorting for next commit not for this
> commit. Can we have approval for this commit if all other changes looks
> fine.


No.

-- 
With best wishes
Dmitry

