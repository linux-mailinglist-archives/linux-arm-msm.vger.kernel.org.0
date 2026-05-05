Return-Path: <linux-arm-msm+bounces-106002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO4rG3oe+mkJJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:44:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E21894D1910
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38D02307CDBE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 16:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62A64949E1;
	Tue,  5 May 2026 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjftXHJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R5W2uVyS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6831249252D
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999365; cv=none; b=uDbk6TkVvuY1qfpqD6VVoFZFd4T0AF5SdXtusmz4+7asOVelIYkx2wHFZjt23qU9AnwiRIA3NwGj3IvbiUw0jOhloh+C5oDeUoVbneVjtpIPFmBYGnnAQMOSO8wB0xd62AW6q0vpZWGhnBXiMBW39lFkx1bZD7zcCMTmqkWLKUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999365; c=relaxed/simple;
	bh=XWisdthpXEsZ1h/uQy51Wp0h5gBanWMeshjhe0Ik7mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYPaxLDEqsfVx6wEYOiyi9dkC2HT6/+4m9pzHqlfem5L2EnEVRYblhagdnPI/P3IR8+HUvmnSmciFPP3vL71uRzYs4OMCdYZEJ7XBWadKkdlDvgR0kHyfUCZX2G6Cdz/vC+DWd9NIZHEZBIe7a1fE3IDR3dtFduXRkk3yjo658M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjftXHJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R5W2uVyS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Djdpo3501574
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 16:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iAYFcoBuVm/XcG40EG9yN1cf
	01dwHoZZydGSBQe+fRk=; b=OjftXHJV19fGxCUgY3Jz9FOUwuFlMyIvE2v9eq/r
	Csyto4GYkW31L5U9eST4MIKUcvENbIA8pp6Ma1FUOidL0K7MOjMfgjXVL/i0FnDA
	XphMZ8h4+N/0ZYpTL2BPZSQhxPzFo/K2KcmPT6DYB+4UKJ+dwRrvZoCKCj49KgJH
	7c718rJcgmjNAENjF1HDZTYX7JCdBHeSLp6Nn7tv8gPxJp0fMji/WDDx6CJCZaYB
	pu4dUwRprcupX2wyhzbWr/F8IvsWvCJJjOU9ScFdQkHTZVUoPg4jrN1N4dWw7f1W
	YfBe34FRZkVd/mj00lulLO0reQND555HWK3GlKXbsaM5bQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhqf8s7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 16:42:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba718173d1so5116155ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777999362; x=1778604162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAYFcoBuVm/XcG40EG9yN1cf01dwHoZZydGSBQe+fRk=;
        b=R5W2uVySS0pmd5cxcj13xoQMlKnhDyhJ3FyNH1guubs+B8FKBYog6KjcGw8GLymdfb
         q+idn8NadUnJen/L41Um04wHtGUv2qwV+gSH0fQM6xFaiWPdSg/dOIRMp3sTQ7P6PkpG
         Z4WZoTpMTdnjhnoLeiBFGG0/YOsq57ydnFt5Ilsf1ar+IUM6zoF+O2bWQr7O5/Noum/R
         uZcxOiIrlvfm95YyjBHOElvpD9ij0tS8siU4l1GEKhND5rCVMQdRd8zxzcfdincFsna4
         VRt14laUko8d+1WHvHwWTmOsbIL9Ui3LLiaLy5FrCSMZJ5uQb7aDh5BoKya64zoo6J9O
         5aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999362; x=1778604162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAYFcoBuVm/XcG40EG9yN1cf01dwHoZZydGSBQe+fRk=;
        b=RbzUx//2x1FqshBAXq9BBh2byTxw8u0BFT/nZld0NDetPDrqpqoqQO2SE45JfFlFw+
         S3kdS4cvwStuaJS+zYB4AG/Eflj11Uiqa7eNejcXOu6R2Unj4CINoqiDx4Ag992suJeN
         ZBiMRCeOsdZniIuzqQII3p0IsAyOwKWE5JSReV6YI830safEwXazZVS3xADwxWiVEUBc
         80dX7r8HCYjq6Wv3pp78LjtAXDIMj55RJ57+FbCynC0EbvW3WiGxr1vsP8Ei6pyQ3n41
         ijAvEQz9E82c9dqUeX43ieyg1rfc0zhKz7ILnG0euh9Q+vpS1yAnotYu8sE0HFwRIPO/
         WZMA==
X-Forwarded-Encrypted: i=1; AFNElJ/ybl0gxUNRNQN3/xnbbc1gYzBtQy/WAEh3eXH6RQLIrclRqo2A/D3Ezrd8vVcWRN35RI5ev4Q3MEfcdRun@vger.kernel.org
X-Gm-Message-State: AOJu0YxDnyL1EYSkEI4CKo8QcOYBnyNz4Nb5q7PncqL4iPYj2bIpJOIK
	AvB3zhWJKXyfpLr4eJAhjx2Lt71K8i1YY86x+/0ZucvT219ARCYr4vA7qbjS59xwjTvWOVa/YGw
	ZpqTUowKnS6n65S3N2sWB2A6sHK/qQ3NPLIJ/4nhSOvUf0iO+qNI9AjvBrsKjRGnuM4pz
X-Gm-Gg: AeBDieuXPcVobitWc108siGHBzsTlCtwFBzNIOtXCuPqw5MoO091pqaGPW9/F/fnTxf
	lxi8o14j6psjyy3WMX4QRHuEhiAmjlIb0qeoar3IyjxgLUhfwczVIcYrIbIb2YieoDnZCVVoLJv
	Gi+NjLtFPGhndggzG+8KcCyW7lPW4/XvzXnnUA/wKHV1d/6m5GHWDy5tvoklJYEEHm5hGxqxWa1
	SIwsyVEuImNW3jeFwsuh/Vi0CaTmzH40LZo4umcFD7jLJVcyayghvOAdxy5FDX8lLetNrm25kFF
	FZfWGvSmw7sEpQ1B7tbLU+b0P8TguB3ZJZ+PmPMkCUTqgSZwblzuY7h8Regbt/TRLRQnFwfYg2i
	wCWG/G8f6ILF9YksQ3wlr4mPgLvO490nwNGzjystS0JGEWA==
X-Received: by 2002:a17:903:2ecc:b0:2ba:15ff:345d with SMTP id d9443c01a7336-2ba15ff376cmr108941575ad.35.1777999362300;
        Tue, 05 May 2026 09:42:42 -0700 (PDT)
X-Received: by 2002:a17:903:2ecc:b0:2ba:15ff:345d with SMTP id d9443c01a7336-2ba15ff376cmr108940885ad.35.1777999361838;
        Tue, 05 May 2026 09:42:41 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae0f6d8sm144847685ad.39.2026.05.05.09.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:42:41 -0700 (PDT)
Date: Tue, 5 May 2026 22:12:26 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
        rmk+kernel@armlinux.org.uk, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>,
        a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
        boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
        chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
        julianbraha@gmail.com, livelycarpet87@gmail.com,
        matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
        prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
        rohan.g.thomas@altera.com, sdf@fomichev.me,
        siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
        wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
Message-ID: <afod8ot7xb+g0wzN@oss.qualcomm.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-13-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MCBTYWx0ZWRfX9RWYpoc8EOgo
 r5P0T2gzeYA6YnmBwrEvLh6DaEULyFiEjEY2hZ70781O1CetVCEidjZ/bfXnkuqk3METrd3DgPc
 STL+O1v3pbUUpvdXolWpywc4lt6qiqqKB5giu7IEY5erUFw5a7G7Sz8qGoCIh+R5RRE1X3EjlaE
 lj0kMp/jCQyHc5tUdkP3x/4vk5cSsbD0XBUpfb1LEIk1XT7bJQTtJULRURy+d244LlAjPyI1Oxc
 UyXZHO/vT1494ERRa/or/eUxz2mhm2XlI8eDxqdfrZaOzuRexahX0+qFx26hm52GgxTyWoM5wiQ
 IzJI9sNJ+YjqBCODZe6fO9oq5ewkivVBKIo7NrpbFLjKehH7HfZ5RPGclkMXxQo92sveuH4ZQYq
 e5DAG3m+sUUxnWR8AEcSHjHsnfZBhsSlZ1Pb63+6pryyyKThFEAA40nYOnqWPW03ySxq7jGqMSJ
 aYf7wKyXZfHw7wovVoQ==
X-Proofpoint-ORIG-GUID: aQSYQi-J6JC2-194DyGu6-5qjMSanobP
X-Proofpoint-GUID: aQSYQi-J6JC2-194DyGu6-5qjMSanobP
X-Authority-Analysis: v=2.4 cv=NPvlPU6g c=1 sm=1 tr=0 ts=69fa1e03 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ee_2aqc6AAAA:8 a=lW0hg0oAPnnF6MRRTAsA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050160
X-Rspamd-Queue-Id: E21894D1910
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-106002-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checkpatch.pl:url,riscstar.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Alex,
On Fri, May 01, 2026 at 10:54:20AM -0500, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
> 
> There are multiple builds of RB3Gen2 with components included/excluded.
> That means whether or not there is a phy attached to eMAC0 depends on
> the exact board. However all versions include a TC9564 combined with a
> single QCS8081 attached to eMAC1.
> 
> Add properties to the existing PCI nodes to describe how the TC9564 and
> QCS8081 are connected to each other (and to the host SoC).
> 
> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
> binding, but checkpatch.pl doesn't recognize that.)
> 
> Co-developed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>

There's a minor typo in the PHY name - QCS8081 instead of QCA8081.

	Ayaan

