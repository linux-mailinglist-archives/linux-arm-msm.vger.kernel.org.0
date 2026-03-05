Return-Path: <linux-arm-msm+bounces-95687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLuUGibeqWm4GgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:48:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA49217BEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30096308F61E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 19:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403A62EB5B8;
	Thu,  5 Mar 2026 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVyPjx1m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOPi9jFA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47622586C2
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 19:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740019; cv=none; b=Q9kKGZ7yrd+b36iBrVbZLUf37Ut6sVl91j4DIxYUHFXaTTToezK40q+VYw0hqNTl4XHlOHiDKQKiJ5oQa/l9erbY4oj8W5RVrndL1+fvYd+8+5txtioRUXS8W+HFwl3KQvSeEWcocoumgLdW/7vEY8HmcTBf5PSGH+MZJWAiBFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740019; c=relaxed/simple;
	bh=L2nZmKFBfiltDip5mXYLimFw1wVmBhBRcbytbcN3vT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgu0CVR57vP+hFV4MICAJaDvjAqIJ7dNbO9pSJ/H0+nOrHVOYdcaGovsnO9af1HYmj4Y+tdDebkKp04JmLifao/KY2yfqneZ6dItkOKlOhwYRGSIGqXAeKMMlWewqadBet6VrA0rLnDnmm1Uz7KUuYhSDHaWqSOIXj70H9jgI5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVyPjx1m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOPi9jFA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625IX4Pm917167
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 19:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BfZ8msjWi+nSqCzSNJt33u+/
	Gp80GIWb0kkR+dbpO0w=; b=nVyPjx1mleVWKNdhQA/r5DpCmDj1+ySyaOrt2DvP
	ZZuucK4P8OV0c5fTzaGFmJi2B1cqEG0UtRtnDxoKAEN8K1skc1pD1S2csm0NdzQJ
	qkc5Q7qiqa9D9cqLtXNJlrJaJNHhFUvOmGhtaGzViaKJeLxSx7LYEyG5JirpUF/I
	89klpX/FiIBcLBXH+JMDnE+l5VP3+1nFbMBNFOJoBUnOR5eroMvit7na3nyDnDkq
	6lNqB4Rz/m1mv1pjI7XPkffqxV+7wjm2k4jkpz+RMXJsLF4aaKNXYvxBhS5R+FXL
	zdm8V1pezHxi7lYV8HF0M27GjgIaYPEzsdezPy8WjIRZ1w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380tx63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 19:46:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8273965546bso19247152b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 11:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772740015; x=1773344815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BfZ8msjWi+nSqCzSNJt33u+/Gp80GIWb0kkR+dbpO0w=;
        b=ZOPi9jFAWSW2gecK+7v7LMzI8Tu62cRM79lvCNHyIgf/rUmcJayJqMyyxl+FbffjNU
         WWsNwKuzs1fRdwBgBEXCHUeXtWc/zrmygxaKW+TCim1D3wwWLYATU/wDZHcoL5iFiOHu
         1jF5maygu+AHnHPMK2NOs/Pe1WPUaUOl6IJag4Fii4xObJBVYGI56O/Svou8e+CkxkBx
         tzbWqf3VYy7mSWN5FqzCjYxarN/Nrek8trIQJgIEnuRbhCKo3AjVc52AgjnmKeYmlh4b
         8qBKIYwOK05soTWQW5GzAfCVl4THaywEj8eeZ7QkmU0Er5cdFyX3TdH1XRJiknBBhgTI
         +c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772740015; x=1773344815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfZ8msjWi+nSqCzSNJt33u+/Gp80GIWb0kkR+dbpO0w=;
        b=iJcxPzbOQAa138H85fyTwswFLDo/hdL9SGfMzcRQ2uuzWqGuTlCN8zW0Bhj8ECPqnM
         xMdFhBKPZpbhMCsBtC7EGwbhCzUT3/MYpE3OWIfSrJMeJHF0jqpMdVMFVdNwCiH678cb
         i25vdNLiSGQqWreqZJIU6CVNtBrftwBy0+mO1rO9tHvurPg8e9tA/EANSGGyY0xRTO3P
         0i2206O7FyiJ0tTTvoYAFu7Xmk29gtzn/kfIEJDo2Dc3FX3gKwjbaAGSGPpKFqa/Dzjm
         ZcRbxfuyjiM8vCgejn6kgBdZrRKiLpKBx1sZ1SrshfZl+3Wb0wddDyS0FedIlv6Vzudu
         Fe4w==
X-Forwarded-Encrypted: i=1; AJvYcCWARbXrKO6wdsmjUhkX0gUSvvg0Y2dF5RduQzpBdSSdmnNBRTe7dO9DySh4ChFY6Y9dNppZOhiOEmcqjL/Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr3zc3u23YLmVMKN9cDl3ObU3vNYb5Z6am8OX6T/V6J0g666//
	mnTW+mPo2IoqiVFhqGYisB1UbvBbDHtsqTl2X2wvGxSrtnKyzhk8RsIcy1B17mWqNLHyDhaY+aG
	CSwYkiOeFcvlAJxIDhuWkwIJ3PmhnFmGO5ahEgvXgPY96F0KLhTqeqnDrE3DFYARPWLQI2mYQAy
	YJ
X-Gm-Gg: ATEYQzzR5FCgpjD7cGPar1ybZuMvP9SC71zw7Ej/zNkiS3BIrK6VY8tm+ywIqAQP+hq
	/zHOrpPkMnjos8rSeM1n3hMVAdjwoLj2kj25WOBFzYSii+lXxkzdhncJAK9H8JDkINO2cr4NrH1
	KlmjRN/68VZ6+/HEoI7obrs2QuXVXXsPKux6Ypkors8QQptbT9Jgx5xoj58INLFPp52iR6ymtpG
	elBhp6smLgdtlvvonA5Os4xXibr9rcHnGRJ07D6h2FvI6FULtF5HCTQft2bGxFcqP/oBBmutCMN
	iPiz24r7/Sh5mjZrEmd16DigXBQG9xkKTHxeCabGf1dzX/NC6Nw4+dc7mfis+xInp2eOsK9LoES
	l00J38m36l6KM6brgCrDcYP1XpJkltTO9JNg=
X-Received: by 2002:a05:6a00:a383:b0:824:b1fb:1bc with SMTP id d2e1a72fcca58-8299ae2fee2mr760121b3a.62.1772740014896;
        Thu, 05 Mar 2026 11:46:54 -0800 (PST)
X-Received: by 2002:a05:6a00:a383:b0:824:b1fb:1bc with SMTP id d2e1a72fcca58-8299ae2fee2mr760101b3a.62.1772740014226;
        Thu, 05 Mar 2026 11:46:54 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8297e4fbc2fsm4546974b3a.54.2026.03.05.11.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:46:53 -0800 (PST)
Date: Fri, 6 Mar 2026 01:16:47 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next v2 0/7] net: stmmac: improve PCS support
Message-ID: <aandp3FYSJbwoZxo@oss.qualcomm.com>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a9ddb0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VIWiShEBZmvcmD2q97UA:9 a=Ds3QMCVJO9KgxsKD:21 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: U6tYZ-rby6e5gxpAIStcf1MKQkMfbENG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2NSBTYWx0ZWRfXwXfuETq3V8yu
 Rum2cqXMtEtpqkPmeLLgVUW21cmQErT2YR4IRo262ke0HOCyMVKcDxbKBC1Vc5Z58WGlkN8vQ3t
 UCYoCcS8bHixiaZ1lbZveyEoZXcIK6FcwABSnmuVpZiF5QuEKaCYchQmeSuCGO8oG66+lLkMFbw
 864wqWUS2MtPkkcvurkeZ/oJB5MH+/4zmCJcbRVympTaKuIwm5NRdX8eojPqUxUpjVTjdnP6os/
 /u2/OyX4qWzzHIXnnbBLwz5nQHdMX+azAcf/NAopo1cRpewL8I8x273iC6S0oCEX88EFZ5pNj73
 Ml4l5zkf5cDnSO8sMUZARuw5U0jEHq783wo8QWQuFIGK7E0vesTcvJl6cq0WglqSTXapFWsRYgB
 7pOc3DAYwECe1T3zjfDiOgTp3vRFs+TO2mqlMHcxDY9IMTos0DCEKwOrg3cGJtVm6SrDPm3Gzdm
 JpZBcw0PaNXojSUYuOA==
X-Proofpoint-GUID: U6tYZ-rby6e5gxpAIStcf1MKQkMfbENG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050165
X-Rspamd-Queue-Id: BBA49217BEC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95687-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Russell,
On Wed, Mar 04, 2026 at 08:47:36AM +0000, Russell King (Oracle) wrote:
> Resending this as the original RFC now conflicts with net-next.
> 
> This series is the next of the three part series sorting out the PCS
> support in stmmac, building on part 2, which was posted yesterday:
> 
> 	net: stmmac: qcom-ethqos: further serdes reorganisation
> 
> Similar patches have been posted previously. This series does away with
> the common SerDes PHY support, instead using a flag to indicate whether
> 2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
> time, I have no plans to resurect the common SerDes PHY support - the
> generic PHY layer implementations are just too random to consider that,
> and I certainly do not want the extra work of fixing that.
> 
> I've also changed the last patch which prints warnings when qcom-ethqos
> changes the PCS state - this will now indicate in a readable form
> whether the ANE or SGMRAL bits have changed state, rather than having
> to refer back to the definitions in the code or the databook.
> 
> I am hoping that - subject to this working for qcom-ethqos - we can
> drop this last patch in the final submission, along with the
> dwmac_ctrl_ane() and ethqos_pcs_set_inband() functions and associated
> definitions. This will also mean that stmmac will finally be driving
> the PCS correctly from a phylink point of view.
> 

Apologies for the delay in sharing test results. I had some board issues
to work through.

I applied your previous RFC series on top of the two qcom-ethqos/serdes
cleanup series and have the following results to report for the QCS9100
Ride R3 board (AQR115C PHY):

  - Link up at 2.5G, 1G, and 100M is fine (phylink logs below). The PCS
    link takes a moment to stabilize, but after that it's stable.
  - No data path issues at these speeds either.
  - The warning ("PCS configuration changed from phylink by glue;
    ANE 0 -> 1") is observed when the link comes up at 1G/100M.
  - I did find one issue: the data path breaks when the link speed
    changes from 2.5G to 1G or 100M. Notably, this is not consistently
    reproducible, and the issue persists even after *dropping* this
    series and the two qcom-ethqos/serdes cleanup series, so it appears
    to be pre-existing. I am trying to debug this separately.

    Two additional data points: this patch series may have increased the
    reproducibility rate to near-always, and the data path recovers
    after an administrative interface down/up cycle. Logs for both the
    working and non-working cases are included below.

  - Since I still have to test on IQ9 EVK (QCA8081 PHY), I am planning
    to rebase to the net-next tip and apply the latest version of the
    series. I will share an update in a couple of days.

    Ayaan

---
Logs

1. Boot up at 2.5G
	[   10.895909] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   10.905494] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   10.905501] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=289)
	[   10.905504] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   10.970145] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   10.978487] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   10.986630] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
	[   10.986633] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   10.986636] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   10.999279] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/1Gbps/Full/none/off/nolpi
	[   11.524483] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   15.571728] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/rx/tx/nolpi
	[   15.583871] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   15.592285] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control rx/tx
	[   15.597500] qcom-ethqos 23040000.ethernet eth1: pcs link up

2. Boot up at 1G
	[   10.225496] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   10.225507] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   10.225514] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=296)
	[   10.225518] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   10.570643] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   10.578994] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   10.587126] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
	[   10.596149] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   10.604727] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   10.635960] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   11.166068] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   14.009935] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
	[   14.021130] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[   14.028849] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[   14.037455] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[   14.045597] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=03
	[   14.062429] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[   14.071296] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   14.072349] dwmac:      ANE 0 -> 1
	[   14.077643] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   14.086899] qcom-ethqos 23040000.ethernet: PCS Link Down
	[   14.095640] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[   14.101012] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[   14.104778] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[   14.109740] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[   14.115609] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   14.115616] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   14.143888] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[   14.147725] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[   14.154217] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   14.154225] qcom-ethqos 23040000.ethernet eth1: pcs link up

3. Moving from 2.5G to 1G : non-working scenario
	[463994.745225] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[463994.760504] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control rx/tx
						**DHCP/pings work fine**
						**Link speed changed to 1G**
	[464006.855060] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/2.5Gbps/Full/none/rx/tx/nolpi
	[464006.864767] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[464010.370790] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
	[464010.377197] qcom-ethqos 23040000.ethernet: PCS Link Down
	[464010.382018] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[464010.385204] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[464010.399011] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[464010.407690] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[464010.415922] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=03
	[464010.440494] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[464010.440977] qcom-ethqos 23040000.ethernet: PCS Link Up
	[464010.450504] dwmac:      ANE 0 -> 1
	[464010.455870] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[464010.465325] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[464010.465957] qcom-ethqos 23040000.ethernet: PCS Link Down
	[464010.474105] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[464010.479633] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[464010.500532] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx

4. Moving from 2.5G to 1G : working scenario
						**Link speed changed to 1G**
	[  123.351212] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/2.5Gbps/Full/none/rxtx/nolpi
	[  123.360827] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[  126.742306] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
	[  126.747557] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  126.756547] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  126.762525] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[  126.770227] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[  126.778814] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[  126.786958] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,0000000,00000000 pause=03
	[  126.800656] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.805951] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  126.812286] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  126.817748] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  126.823693] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.828973] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  126.837039] [DBG - SerDes update] ethqos_fix_mac_speed called with speed 1000, interface sgmii
	[  126.846539] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[  126.856546] dwmac:      ANE 0 -> 1
	[  126.860098] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[  126.860554] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  126.868794] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[  126.874228] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  126.874286] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[  126.880062] [DBG - SerDes update] ethqos_fix_mac_speed called with speed 1000, interface sgmii
	[  126.885958] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.885966] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  126.892519] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[  126.901370] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[  126.927532] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.932822] qcom-ethqos 23040000.ethernet eth1: pcs link up


