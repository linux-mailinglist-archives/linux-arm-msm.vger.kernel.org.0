Return-Path: <linux-arm-msm+bounces-110519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDTHBFY6HWoqWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:52:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 995EB61B1D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3396C3007885
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 07:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6201533ADAD;
	Mon,  1 Jun 2026 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9SjkBQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAH7PrEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E182038837E
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300362; cv=none; b=W7y61V7S9rrdMcVDOWRPtbMNprMdNXzMVTa1+cMU7TO01Omz5TLQIU9cC0GAcKByvCt2K7sxjG9GLtKfMGAyC3Ncy/ms/404Uio2sN4+mG1Hu5THl6B8tNNA/GBNiFNgCPrzvPq6cNCd619dP5hhLgx7hKU6ylhpc4pgkOdNL1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300362; c=relaxed/simple;
	bh=DdHQWcGkWTZQsq+tx4owO1SCoJ8vL53+Lw7JFIQisUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgyivVF7c+wkpkQgxGtESe3WqKMxyt4i2I3PGmqa2Q/YTZ9VGylRqLFu5UPqYrzfhlMhGYKwMxvCVpnhSesSpnjsAVCJbbbtxa1mNv/VxXgb2BrCSCLKj9uy3mslvzNCweLyaC8w1CQT1tvS38mHaEhKxHjYFO4Kovr/babrodQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9SjkBQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAH7PrEA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6517N1m62882669
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 07:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+YEpzlsDuhZpuFokwgbow4nr
	FcwBt8AvwHBDugGozCg=; b=d9SjkBQ00TphNyTkMSzYBKAF+zrlYrgbw3uZmPJ4
	7uzJVOufc1t0UF0P33P7pRCHhlMkOKCzxc3VvMCY0Y6m/QnANmKVTIj6/YWzvvLD
	wk1J7JZR7KYE2B9f8rGA7BNt2Irv3Q49Co38pRaX0YzyZTdUDH4xnONchGCZVpGt
	KZRUNYpwpBQ3ZK+JwZe/Ot0wRVz2mD4WhG4sXe01kVMZGvPRnz6XPmmR1hhPwfmF
	pCQ4QVOZ/RMlfAwNKUVXYPO4rgruRhp2EUKL+xJvGl7/csRV9U9aD6bXU65uSTrr
	g/kIGe1jZv3S6XozZtObynveaAzeYgyeIWE53H5Rq7iO0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7feh6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 07:52:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a0e93eeso34903751cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780300359; x=1780905159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+YEpzlsDuhZpuFokwgbow4nrFcwBt8AvwHBDugGozCg=;
        b=EAH7PrEA6fGdDdcd1tadMpoJApC2aPDfea+YnQZgc4iEKXs/pkg5mRBU2CC12VOtXT
         +H7cfSAV0krw7eMQEmCwllZBS0IKK2QzbktDNhknbDMHvaIDNRh+Y1L3Qw3Wy11Xxrnl
         YqfPlw2T7d3ZS9aZQPmN8fTM1UN1LiYTa70YEnAkr7kGWECWD2+izA2EE38P8dkxGFqP
         A4JtfCml/hxreGizZERPzqK1cqkextuarhf309gvJGWo6QdVcrs+dp8VUImyz0FZ+0Ay
         gX9bzPAmPuSuqmbbUFHojto5wCAFNWpzzC5XEvaV92LADeggH3dth2l10Owd/ZM7ma1P
         M3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780300359; x=1780905159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YEpzlsDuhZpuFokwgbow4nrFcwBt8AvwHBDugGozCg=;
        b=r5Fwd9dWxrWphsNooBa4AA1Xf29Y7+5DOqea60kcTt95uXpvlAowlxTH9mYFZxUVdg
         Ok4yejUGeZG5u1sGKn0ZtQ709bAKx8zJbKDgvUasaQ+A485D0b9ejpIUINGlAMh5mDdf
         OaeG9gYYQpFzbo6d39wnKC+gHstqWW/0Fm3XkXc86kaVji0rfD9eEgq8Y5uLIt6L6hRM
         zeJJhT8swlXDYV5qS2gnvo5YvBFR5acYKzSNn8ZhgSvq3KDnaR47qpZJ/PtymstVci/L
         DRT1sYqxuoGed4hIQJYrNyh0yDI6PTB/8LUDhR7QIy4XRxGv/QJ1QUJMco3OKEKX0pUZ
         pZqg==
X-Forwarded-Encrypted: i=1; AFNElJ8NkpkS/1cQpwOXbqrGEuSgCYzjINV4ujmG8LUTaCAh6jjWkFtrsz8weVtn6EkAdafa984PCl3rs1Ey1VId@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8UgT9Vu7tUODO0p+A1Q3LiQQx4rVT/K62MW0W/qZtAwxbYyOa
	etHH764s4IUwHEynYm2qq/rfFfVgOVerIW72lbWu7irw9Px2xevK3ScA75BY+OtRL3VaMEKu/Ij
	DXWCeGHV9avc+7Aly70+QMqFnXCX6lYH4ZDOIbezSQdOYej1R7cSlDMNn03zLbLyOwR5/
X-Gm-Gg: Acq92OHZG3bE6zr6K62xghlF+VSLLM0tvhFZkRnO1HdDhMyADoNxCD5kmG1cgWjnlvc
	mobx7VVcaYilVh+fnSY/fnxmXEldms//3QwrRBmUeLAYy44MA3ox+qvLXzsa2mmnDOEBTWQeSm5
	bQY7MA+SlLokMI1HFO1Q5un5CHEp+z2FGAXk03mUALsFo63WKs8qhxxWQz1IpJLJB2FNLE3ibqU
	T7SAAH2Zdf93udlLoNzpLfpQb9tJ0HhJb9k8qrDYygUE4YHhEmm6D5F4MyV1V+TDOT8T+Aj5b8x
	nRNPaOWAPLU9K1v6f5HO8mLFrFy9NoHF1exSlvy05C4BfbH8OfOPJLCuoUKmYCEQ736GSfvEFzv
	hMkV7aEcCNR9ZLjWRdIytHuVV390zMTUQfIl9AgRnIrP7JDHrIvOJpr8w5hkmKLnauBqTYKIiZ7
	HdXgrkvvHc943WKyrPLL01P/MKx+zjIJ2Mn5lhPeO6vBcFcA==
X-Received: by 2002:a05:622a:8586:b0:516:f4ef:5c8 with SMTP id d75a77b69052e-5173a70df62mr121771681cf.21.1780300359053;
        Mon, 01 Jun 2026 00:52:39 -0700 (PDT)
X-Received: by 2002:a05:622a:8586:b0:516:f4ef:5c8 with SMTP id d75a77b69052e-5173a70df62mr121771531cf.21.1780300358615;
        Mon, 01 Jun 2026 00:52:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39661e708ddsm19120501fa.22.2026.06.01.00.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 00:52:37 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:52:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: bluetooth: qcom,qcc2072-bt: add
 bindings for QCC2072
Message-ID: <mcn4ysrxrfqo36tr7khsxnjase3priskimkgxuacgma7jcpa46@bgla2znqhyfl>
References: <20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com>
 <20260530-funky-mackerel-of-current-878e2a@quoll>
 <6c06e372-85b4-4207-9bb6-270bd654c287@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c06e372-85b4-4207-9bb6-270bd654c287@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ITcv8jFqiYk60h6WK_uV5xhQQMU9T2z3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA3OCBTYWx0ZWRfX+77Nt5hOhhdC
 9woPYdG4C2PF5ICXN/zwmuzBRR6E7J6nympjP0D5tTdC5CYz5jvt+4j/+d7fFAKQnB9yIqDFYfy
 UKGtSH6NWpygYKSV61wEHjlHq6BSD7eZK50ZezpoL9sSpWyBkbKczahXrn4aat4mrKt85wjkDbD
 HDFxxrkP4LZfBKELVqtmxrynhM3p0+g+clH3hDmG2Jwpqe2nleaXufNSHURav5tkzsn+DDFQ5Dc
 pCW31hEoZG7bL0Y/OaIbodnmJg43+A+ndfF5dk0tFWWcPZM3efRqntMjeL/xoGIX4XF87U52gZy
 obg7YId6xccSIJ3FD9DaQw+WQnow5MO1YxKyCZe1OrroXGNJxJiVWEiRBQ2dslFxlx5sS1KDVwX
 gC8zkIXQZj2sSQRT90Z2+2Sjr/FI0iQCqQcxgnm7IIdjwVk+2+qZG1xjlfzF55rcRoXvabq0aZp
 cUjUnyOzvR6sM9DnCjg==
X-Proofpoint-GUID: ITcv8jFqiYk60h6WK_uV5xhQQMU9T2z3
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d3a47 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P-IC7800AAAA:8
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=mlDIMNG6S_g-ndTHxx4A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010078
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110519-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,quicinc.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,bootlin.com:url];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 995EB61B1D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 12:50:00PM +0530, Yepuri Siddu wrote:
> 
> 
> On 5/30/2026 6:04 PM, Krzysztof Kozlowski wrote:
> > On Fri, May 29, 2026 at 11:23:42PM +0530, Yepuri Siddu wrote:
> > > Document the YAML binding schema for the Qualcomm QCC2072 UART-based
> > > Bluetooth controller.
> > 
> > Where is the rest?
> > 
> > Also:
> > A nit, subject: drop second/last, redundant "bindings for". The
> > "dt-bindings" prefix is already stating that these are bindings.
> > See also:
> > https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> > 
> Thanks,  I will update this accordingly and send a v2 with the fixes.
> > > 
> > > Unlike other Qualcomm Bluetooth chips, QCC2072 requires no external
> > > voltage regulators. The schema inherits common Qualcomm Bluetooth
> > > properties via qcom,bluetooth-common.yaml and serial peripheral
> > > interface properties for the UART link.
> > > 
> > > Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> > > ---
> > >   .../net/bluetooth/qcom,qcc2072-bt.yaml        | 38 +++++++++++++++++++
> > >   1 file changed, 38 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
> > > new file mode 100644
> > > index 000000000000..8e2f15a75d62
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
> > > @@ -0,0 +1,38 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm QCC2072 Bluetooth
> > > +
> > > +maintainers:
> > > +  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
> > > +  - Rocky Liao <quic_rjliao@quicinc.com>
> > > +
> > > +description:
> > > +  Qualcomm QCC2072 is a UART-based Bluetooth controller.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - qcom,qcc2072-bt
> > > +
> > > +required:
> > > +  - compatible
> > > +
> > 
> > Looks heavily incomplete. Devices do not work without power for example.
> 
> The module receives power through the M.2 edge connector and manages its
> own power sequencing internally. Unlike bare Qualcomm Bluetooth SoCs, it
> requires no external voltage regulators, enable GPIOs, or clock supply
> from the host, so no power-related properties are needed in the binding.

If this is a purely M.2 device, then it should not be a part of DT.

-- 
With best wishes
Dmitry

