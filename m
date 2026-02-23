Return-Path: <linux-arm-msm+bounces-93741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOs1MOOJnGlWJQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:09:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A617A63D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10A363038FFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB0132E729;
	Mon, 23 Feb 2026 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bghbiY7u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbZ8VsXZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AC532E68F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 17:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866566; cv=pass; b=enM9uASsFPeTP1sK8/91z7Mu8hh5mbeWhj2WqVT0prINkkkTeDRp7caYjScvfN/XDpT/VsB6noqdsLdAU1IMzMYkXvNYFUcDMTPoetTR+Y8DB/X25UUx88mNaYuPvFOSY0lt1fhWq6lGq8RDnuNnIHDeKLY//RxX/0z/Z2VQIOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866566; c=relaxed/simple;
	bh=bEIj0WNA1JPDgmSNrfUPFvoUTelCW2u1zpq9ZizVch8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6CSvijT+veYCrkqBPCB6bT7O4eY/8L3Lx+58b/2Of6d5LK3Nt2c8Dh60SRiEZKjttr3gyl4w5GSEz2vLi4eMjkgwisNxvbtGiVZ/swOEqxXCAgKKtg4b9Swh7kTLdbh3GUh7UHJyHvh5QLJ5irAEdU4haaNDwU9FpPn4Ezd2E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bghbiY7u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbZ8VsXZ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRJvK1640611
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 17:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v4wJf3RfvYx/N6YOBwnzs0nO
	tYOlLmOqFKLIASO8YBs=; b=bghbiY7ue+A1njbaWrWACoe4QvDba1Ik19DEIiKM
	hnDcfP2Hvy1NzP0BgmD6Px+voM/fNRgWsGU9YDZG2S0LNO1An9ywI78EjFaW1Z/q
	pe6E0bCamsWXbzYOb4Yw8znPhMqHU37n1N4D1KJxS1zYa4Ymb1iPw0kRJ9xSl569
	xBmI0paS2tPNhGNiIRf+8D39CtkwDHiZQZwpj01qONyn9E8tNSXzEJnSe//vzonI
	5yixri3ie5gm8Ch+2bLYlZjl1O2ZkRav2Z6BK8CU+rdK2InhgwRhagiKBM/eX24j
	NskMfvMIFTiF6rUviwUmthtXvp8bLTjPlyjtpCfT+bQl3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8r4r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 17:09:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354e7e705e3so3319582a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:09:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771866560; cv=none;
        d=google.com; s=arc-20240605;
        b=j5tn25tfVVEN9YaOnmXTN7trGadgV7hhS2jHKR/In+hvcaPz0Mwppo/o3alfTFXvjj
         QVqRG8EOtFI4+x6pJUKZ5xk2ApR936kEX9SIgYeKcNatCewYxqwGWlf5p6ELDKl8lae6
         nmssrgtRjGzMGy+dUMJnL3tqVwY68UA1MPg+MR64vZy72BBg/Fdfs5sC6AhMgNCbNM/S
         kI9UA/UPOk50qf6foKofXRi67Jv09TzAwdhYCABy7vOPfAwsBYdMY3JL+AFJxqsl68EJ
         1biXgY1jC/ueEb/W20oFw5FCGMAaqqEvYh2lrsguVQe8Ay6jx0NSms4zC4lVaFt2NQ9F
         8Fiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v4wJf3RfvYx/N6YOBwnzs0nOtYOlLmOqFKLIASO8YBs=;
        fh=n35E7csaGFt+hdJ3251yJhz7l5930eeV810FE0d3o2k=;
        b=QSoQpSzrq/Bgvd6CzwLR44UmH0vVpxrwVar+3cfMbxynMi2qVZnwpOqeg1N/W6epgO
         OySG7j/TT3H5fBtSty1Ix2PKuMd8XEvbJhTFJKv+JpbtwafOIgq3vaAJPQaSKWIlEA/Y
         AUcbD3b3fJxd4UHOb05RcTfd9BlRUZUDxvmz/qJCq9pLwEaI9VNZkdKJ3cn8CKLDv1LC
         PEEZvGmdpjbHq63O8864LRhBUMA0qa03YoSmlJIW/V8s/nfYTXJzI1OWtslmm32+Czut
         H91/xRCyUH9JfDdUFsqIPOvm1Vn5MIlzd9X1rGMDlgJg3WvTvXHKyBZElqiti+gXSF+U
         pdTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771866560; x=1772471360; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v4wJf3RfvYx/N6YOBwnzs0nOtYOlLmOqFKLIASO8YBs=;
        b=GbZ8VsXZ4gMCzfvYvZDAjI9gmfXeP3wRbeDw6RT1K8FbYfh76mcJzH3htUEiqmDKF/
         rlczxl7Ve/jjCGm52HsxcyloFAvk50CCv+u8xYrjaBvsoqLRu0o8uYWOZX43Exgjb7Ox
         W5yJBEDBGQkU+FSdeN2BdRRl3vANR50it9/rBrYMRv5VaklLjFSDuoUWY1KrB89mNCCT
         0ftXwXAAp8HOj+yC2M5AYaiiV4WoDBppr7OEC1d2E11Vgdsu0MHUZNrR/UFhU6a0w43p
         qODusMx2ecR1evZnpAXPY+b3dyz+lGmwlpA0z1oH0MpczH9AweV+Mt1Aufyi40CfXaVH
         bMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866560; x=1772471360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4wJf3RfvYx/N6YOBwnzs0nOtYOlLmOqFKLIASO8YBs=;
        b=xBn5I+0MsVIGNkSqVISG0Rk4PzEMGBaKFOjz/MT/kJBy1m2yewLpdRo06YHVt+RVKq
         wXOwZdO3/JK5M9FZC2nhZ5vrG0JlhmJGzNTmTDoX8v/cKs1zB3VpsbGAYk5M7/Hmvrih
         SQtW9ywWT2qaTFS+H96gO7NU8ZLcRQk7um5Sh2PhkR7b5PDSGewrU9o/7PN9AvYfBqCU
         iIwiHnA2BRfRumF8qubK0aI1AIr4Uh9tcc0TQ/PgT5WQAcZg7LjRBeeKgluwQ/k0S3R+
         +GGi3FMVGIvcsblUIX99ZT0+RKQqG84vjytCyauNHrYu4BSv9jcan3p3tSXXBbd7m9KO
         QElQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFcog0z5+uJkaIUf5ilyjWgjiK/LDnZI9bbtY4y4ujp/M6/U1rSmPg/VVIRWQpOBxPbx90tfy3VCY6hDl3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywld2blo9kXvlvCkuCmJzMdvg+k3nxrupa7xscShTMlVxyYSp/e
	mLzrosYd4ePUnWVYo69m16UpSHuIQSF6S+bNo2TPOOZv5V1hVXMfUfK5j8y74N2qwYxfMu0Bow1
	pGzjG24GK+aIT57FGtJUdeqv0QzjF6m0mcL/ZQ83Ba2rUI80eWnlRLbyiOhVIcRoyLcYUIvz/Vg
	VbEo8ps7QcTv9N9HoJdyqPuG0WzMaxgFn100TGx+Sc2NM=
X-Gm-Gg: ATEYQzySaMEMgJ/6Eh/hrr/fxM3l4zvzeDgqY3qkh9EP/ig3uCAw063YfdkRb6QsuFq
	gE4a/nBNV6upe/rFT1faBgrjq++jq1eXQeIoVEgdMM/CEUZVHmbfIlBJDwTf3vgHJbOWfbqrmgd
	MBvffjDpYhn1eMFGChGDUl7SlA0kuLeeBeE4UujvJ4HCVMUgfQpRz8JJC/Stlmms/e/o1qiFLOW
	I6+lJU=
X-Received: by 2002:a17:90b:4d90:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-358ae8c2d4dmr8000829a91.23.1771866559423;
        Mon, 23 Feb 2026 09:09:19 -0800 (PST)
X-Received: by 2002:a17:90b:4d90:b0:340:bde5:c9e3 with SMTP id
 98e67ed59e1d1-358ae8c2d4dmr8000792a91.23.1771866558625; Mon, 23 Feb 2026
 09:09:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz> <20251125-pixel-3-v4-4-3b706f8dcc96@ixit.cz>
 <jqgwmjet2ncit5bqilvuqldxrtcapiozmpbk5klc5tybwbfezi@4muxgno7do45> <599b42cc-02de-4430-b09a-3316677ff541@ixit.cz>
In-Reply-To: <599b42cc-02de-4430-b09a-3316677ff541@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:09:07 +0200
X-Gm-Features: AaiRm50Sx2_n8DihOL9hklXJdrc8Du7OFuYU-F2KAYpfUdG7jvJfCQgmVGzeJ0M
Message-ID: <CAO9ioeVTyoG52=5TRFC3NJqKODXD5eGcpTax9SgCK3b-AznH1Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/panel: sw43408: Add enable/disable and reset functions
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: MXW34J53BD3n8YuvBOq-dUY11k-2QumU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0NyBTYWx0ZWRfX4mRu8OjBJ/+o
 yQ6VGgMjePy/wg0e11HRyt22C9HYFrOUk7+ArOtG+rBvIc4o+NCkYpe4AeryZSLwG1WxUYayxUn
 fSLmPFL21pGNHf2gvb7ZYVm51UYRd4Lu0AddGEt5/LjfNbZLd5QLmawViycqjAxNaI2FF3T5nCO
 +NOEXNLRcxihSL7E5MVI/DYuIq2c0cn//RMQN1xyM4tlecTgVaS6f6vnfXI1Q0IYog97nnSicAK
 sGdIvt/Zr1bs2lnueqlA2KzwsO4W9tHeKqJXGHVF1C9JjK5ntj8ctE75XbroZNgh63CE/afG3Gn
 tVlvSSzjoYAdTpEJ9U+LWNiNK4OhP6mi1LcWxyXC0a+qnf8YqWevZBtwbjb7C242hjS3uDU+VdO
 cjkZFWCWI1IoH9k0uAshJBusuBZGlL5WU6IlU1Iu2GEY3j3kxZYGj9G/yqjKU1oOUXYihub/fYX
 t0V9o7vahfxZmjNFR2g==
X-Proofpoint-GUID: MXW34J53BD3n8YuvBOq-dUY11k-2QumU
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699c89c1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=im9cganMwkklmwY8314A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93741-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,somainline.org,protonmail.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,ixit.cz:email,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 3B7A617A63D
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 at 15:40, David Heidelberg <david@ixit.cz> wrote:
>
> On 06/12/2025 05:25, Dmitry Baryshkov wrote:
> > On Tue, Nov 25, 2025 at 09:29:39PM +0100, David Heidelberg via B4 Relay wrote:
> >> From: David Heidelberg <david@ixit.cz>
> >>
> >> Introduce enable(), disable() and reset() functions.
> >>
> >> The enable() and disable() callbacks keep the symmetry in the commands
> >> sent to the panel and also make a clearer distinction between panel
> >> initialization and configuration.
> >
> > This also makes those to to be executed after starting the DSI stream.
> > Is it fine?
> >
>
> Hello Dmitry,
>
> I was wondering how the exact workflow looks, does this snippet reflect
> real world?
>
> - The path ordering should be :
> - prepare()
> - (host/controller sets up link & starts sending video / enables bridge,
> etc.)
> - enable()
> - disable()
> - (host/controller stops video / disables bridge, etc.)
> - unprepare()
> -
> - So: prepare happens before the display pipeline is driving, and enable
> happens after the pipeline is ready and stable.
> I assume in case of poorly written host or bridge drive it may not work
> like this, but in general it should?
>
> If this workflow is correct, would it make sense I would incorporate the
> phases between into the prepare/unprepare kernel docs?

There is a very precise definition of the DSI host lifecycle. Please
take a look and notice that for DSI hosts there are two different
points:
- the DSI link is started in LP mode, letting the host send commands
to the DSI sink.
- the video / CMD stream is started

For multiple reasons those two stages are separate.

>
> Thanks
> David
>
> [...]



-- 
With best wishes
Dmitry

