Return-Path: <linux-arm-msm+bounces-99372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNghG0OJwWn+TgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:41:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8972FB702
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 685BF3065555
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D033D34B3;
	Mon, 23 Mar 2026 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxYj7eC9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Crpu37qi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63993B9D9B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774290539; cv=none; b=TiTfHsh/gYnABSEG1AZrGHAHKZ+Ceti+RgZ9y1R18Hwb0wDPp710Mg7wsWqDnwG8Bgsu+nb8zsMbKYa9RiAoGM9WHjJB3H6LTS7g9dXBXfXkGMco9bVYds/IHiYJVxULrHD/khQppVJvhKfxusAqhx1w41VRBGIOYEeWgiHjQbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774290539; c=relaxed/simple;
	bh=M4yLosb+fCuLCW+5c3f9foeV3Z4DsImHoVNwXyhXAZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOiS5qnpuYMDIFDC4JY2zCKUF6d768t9r2O/8ZTh3pgDjQFNIrvjalPAdkiwUKBhDgQdtRwyTvDlcU1ztRu5HfvErIGVd7j2siZgnSs2sHuX8NMoFo4h7Ux8hRgsAHJEIH8eOcGThzoNYjUZAPtIE+MUvS6naWXqFBVsF3fji8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxYj7eC9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Crpu37qi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqlW93634578
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+QLEMWavQsoDtJ1N3rXPKXC/
	51Eg1S4SzA5jQ67Ss1U=; b=bxYj7eC91Svu6wZJol5nFEezQ0y8I5SjG7MmyoAJ
	rm+EyJgHc/zQZnpakMrl4Z8FdG9wBiIJ1pfhHOveCB1Vh6Ot3z7JKUDjUk7iE+cP
	/MEat53Zd4Efnu2gQPdRlYV24Tne+V+dS7zjc+qe5PlXFqojRKX1VzDcw3h6jqUW
	KRpmQK6vUwoZYMif5U7PAK+YULRiLE52SYclLSdDDWNdnpkkXGrv5KGklk5z/b4X
	FKwUh4AbkQ59/DHD7YTvuXxVTt2KTP2nV5B52hbqR7blx5H+weg7UDjcpDU24/6/
	P0wP3V3FtuY8PsfVQL0Ued9nEiYr2zRr0PEc5BCu3Bp6Ag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4hjv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:28:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090cc6a7d2so267737801cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774290534; x=1774895334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+QLEMWavQsoDtJ1N3rXPKXC/51Eg1S4SzA5jQ67Ss1U=;
        b=Crpu37qiZaOmvRQR53axEa4Hq7N71mn52SZ+A6MsKIx9wEFMEjKo3IJANGo89t3ws3
         wxyyWJB1fXTcI3eiqqkbnmulAVed67+Ivh1YjQgFFzN3xg22JtBAd+TjJPuKKxB+yo5f
         XESUh1uzGT2vE0hverRb307Z8jGnOyqN5ASjdN2Sf7iulTHMkkPYh2HxZ+c9IIlQd6hr
         gqZJkFac28YmypyPuXz67HFhc5qZGhzGeVWy0Fm31Geegtc46L5YGQRnXQ5w8YyQKuVZ
         UCC/2ErcBfbOXraestJyHutn52csgV8Ea3gyXnyXLG6Cuy3qQj7DMVY1UHknllQrV67v
         379A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774290534; x=1774895334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QLEMWavQsoDtJ1N3rXPKXC/51Eg1S4SzA5jQ67Ss1U=;
        b=q9Hs7iF7r1jjRvR7+j5sjYs9sCb46HpSOwlId+jHy7s0XRRyXglO7TVn7KBjp2/1jL
         eRpBQTV/pEM/u3/t3s6ZadKK5mEdrma1vzDFFFNUuD9lywOxoG+s9Wy8VvPEt8Ucunq0
         rqn5aIMcWox4ANg07Yr7anP2a3L9RtI7Zaiqa3WK+LOhqg6dAP0JTB3O2BQ7dvcaP9FV
         xvMY8D9dyHB8nR4QDcH+GpdBqow3ftuxOQpZk74gw1LuzhOPeTRuf21NN3uNJtAZzcYm
         jDFpbiq9vA1ymjQyeqJXiYBUs240jxwpk37KzgceMMJ84zrBkZov1dtfF0129aPTqzPx
         vDLw==
X-Forwarded-Encrypted: i=1; AJvYcCXlx6yAWyTOR6RW7akyuSx9Aaobx3MGKi9eyt/St0cISh5AVo3MTzmbIP2DYh+QI9M8gqbQ2xy5Dq8+WrXF@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYzbl2bICFh4WU2NLiVUy5zKttq7JCek823uwl244zNl2DLlB
	IrOTEccdVNaCuz9zZ3J7n2t3AB6WLxp1NpX0xsZT1JEE8KQLSGIRmhitlP85KlQOzKRWsJTX5Jy
	h7ntolAR4xY72KOdeGG6DBayiLX8vJVwfrOXFku0VBBRkaWvCjTMA0yLFcwqdWm2uK/Kf
X-Gm-Gg: ATEYQzwEt4qF/Semq1gC2tUK+G5zbxA/GKr+JmKgs1u8gsJQXDJQfYSFz1OvEPV/4Fg
	fkC1IBPCIdT8xu/TqisZREiAc+e5ZuEfkvANJmmlaTnGKY2FSjSdrcMFgqwhTxWooGOrcuHbn2T
	CI6fd9KiPdrEJ8TA2LmUTwsQaPigylpIiWT9wcnfGDiTUhQn+IVHSgNl0uuPh5TCsYO5E/dIQ8t
	QoZ2GvYqahg/LoNMXV0ZGFKJYTch2V0ZbPjk4wYAg97h8VR9SV8tdQYAKWh9aquw4jRywtBPd4E
	GZKnIlvwHprokJIo+RBu5AUM0ry3CILvNiFB0F88YbXHdZ4xV7yiaxZwXNznCDKFHDNqi92KjR1
	BXtWIs2PfEQSReyM2qQVM9wzurrv5tf46pw==
X-Received: by 2002:a05:622a:49:b0:50b:3014:22a1 with SMTP id d75a77b69052e-50b375bcf77mr216836001cf.67.1774290533452;
        Mon, 23 Mar 2026 11:28:53 -0700 (PDT)
X-Received: by 2002:a05:622a:49:b0:50b:3014:22a1 with SMTP id d75a77b69052e-50b375bcf77mr216835531cf.67.1774290532659;
        Mon, 23 Mar 2026 11:28:52 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c7fsm31181154f8f.23.2026.03.23.11.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:28:51 -0700 (PDT)
Date: Mon, 23 Mar 2026 20:28:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza: Disable UFS MCQ mode
Message-ID: <ze4k3ynmcjvjlssade2u4e3femyps5iafufhlgnhnbjb6angja@lp6hv5rk5e6t>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
 <7bpvzg5zkytzgorbuxyo77aj6egcyll4qbzxqknearhxmttzl6@bbrcbxlowtvm>
 <2bd1e03a-7da4-412b-8b90-4f449942211f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bd1e03a-7da4-412b-8b90-4f449942211f@oss.qualcomm.com>
X-Proofpoint-GUID: gndPzMl-rENp-4uZkf9s4nloB44A2Jny
X-Proofpoint-ORIG-GUID: gndPzMl-rENp-4uZkf9s4nloB44A2Jny
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c18666 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1n5GDjukrETTFaDQsKwA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEzNiBTYWx0ZWRfX0ijaRsQpYMpN
 Ztmoa9fltdj99Y5HrH3NoDasQc3/NokdeiZr+Wj5XLHO6TCYJ2DXit8WRSO1wDGdsHwuLzI6DUd
 mZUkZHjv9LA/svSVntThMDZki6xFNsiyYay8wSv7LbFLjED3bM00ixnUL8SF6ybc8tYhq7RPfMB
 3w6iKVyqwRDC3ZkWTJpjM1Fl6fCbbyIYOo9hU7Ew6tKSJHwwIVO6Y7tyoiQPpeUcrB+NF5O+TEK
 w2GqzurXNIszq/iwFqbtZbRITNXdCtYIEi+LVLy0KZOG0EPJDJFSPyuGuFUaR/0oJTNXcNYm12w
 +y6/3E6mtpgJuXDWj9sJrKD7Z6DWVBxV0mnrJC6lIp1HwUB6SFsG7OKdEqknWPGZ3+BF+6UPaRy
 j5V+Op0ioVaJi3jhN80JIdN6xj0MiVUJMQ5DJ5onhiWnLboRem38owlcjoMrxYegfsN9xmrA7kv
 hkHS+ywlqMzvyStk5dA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230136
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
	TAGGED_FROM(0.00)[bounces-99372-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC8972FB702
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-23 23:46:04, Nitin Rawat wrote:
> 
> 
> On 3/23/2026 11:33 PM, Abel Vesa wrote:
> > On 26-03-22 18:08:21, Abel Vesa wrote:
> > > The UFS MCQ mode is currently not functional in the driver. Eliza is
> > > the first platform enabling it, which results in UFS failures at runtime
> > > with errors such as:
> > > 
> > >    ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 4
> > >    ufs_device_wlun 0:0:0:49488: tag#4 CDB: opcode=0x1b 1b 00 00 00 10 00
> > > 
> > > The failures occur when accessing the UFS device, while the controller
> > > and PHY initialize correctly.
> > > 
> > > Disable MCQ mode by removing the corresponding register range. This can
> > > be reverted once MCQ support is fixed in the driver.
> > 
> > Nitin, care to comment?
> 
> Hi Abel,
> 
> Validated MCQ on SM8750 and SM8650 now with ESI both enabled and disabled,
> and it is working as expected with no errors observed. Mounting, read/write
> operations, and runtime suspend/resume were validated successfully. will
> post the MCQ enablement device tree changes for these targets tomorrow.
> 
> It appears that some changes may be missing on Eliza, which will need to be
> debugged separately.

So, after a quick debugging session with help Nitin, it has been concluded
that the problem is not in the UFS MCQ driver implementation but rather
the GCC clock needs to enable FORCE_MEM_CORE_ON for the
GCC_UFS_PHY_AXI_CLK as well, as per MCQ related documentation.

Will send a patch to fix the GCC driver instead.

So this patch can be dropped.

As a separate issue, Eliza DT UFS node is missing:

msi-parent = <&gic_its 0x60>;

So I'll respin the series with a patch that does this instead.

Thanks Nitin helping with this.

