Return-Path: <linux-arm-msm+bounces-98025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ1kHFVcuGl0cgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 20:39:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FEE29FDA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 20:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AED6302A9CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1B13ED11E;
	Mon, 16 Mar 2026 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLDmx1B8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWDIh7ct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A63F3E717E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773689938; cv=none; b=ogn5GR1o0wmRJf7Cn6qswWKQZl9GOFK+0pNEjE133Yzwd3tZIZnp6oX8k7sFSNNP3YzJbItuf6irJGYu7UTpLHEjO2rb9d9VZWt5Q0kNcX/NemIcWp4Iraj7TwG0Qp6vFFujb4ILIxFgOcV01pIJ3q+pvW7NAmRWXSsqBN+YP2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773689938; c=relaxed/simple;
	bh=3bo2Ott2KcKZScqtMJDOFFpHIXfmNiFYbkU0+m7/dNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FK6oXSyx5dHucg0/dNh1sXdZ9+lojX/kagB/mfG4DYZVkq5IGKsajO7XdsvJeff8H6a3QbHeKD8CWkCZXnCPYiuc2leVHog6geDompY8N45gyKKyS8M8kA37/Wq6rGIqMysaYUsrYZaxLQmQtPd4zStj/aFpRfCG1yOKBhStvqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLDmx1B8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWDIh7ct; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GGN1eb3102089
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7qzlLoN9zjaPFn/rROXERl3f
	gzNE1uMnDS6xP6i1YjU=; b=FLDmx1B8O0HCp13KBaubF3wFRJ9ZL3x8rCbFBQ7I
	mTB+Q7KfyQUa9Jn9KLVjxkfbB44/kHk57t6T4e7SumMbqjnVl8luwh1TLaXv8IJA
	T4IejEfjdP+7uWADLTI3mE6epkWNBPqw447EdAjrM66dqV3kDcJqNQgT4wGba78D
	HjtKzNDfD3r9As3p9cENi76fBn41G18/a95y0FxvLVxOg+72i6ZmevHB92PWLmdD
	V610ALqx+s3G0ifGcXN6OFAc12c9spukgMSLdYDRsHXrGQrVS2CNLTxTRTlAS3i3
	v5kInI2pIephQqsI6o/TfRPJayItrqW4s/1a52QiBO796A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb78qn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:38:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd39bso3839929885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773689935; x=1774294735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qzlLoN9zjaPFn/rROXERl3fgzNE1uMnDS6xP6i1YjU=;
        b=NWDIh7ctxU5IhrPcCYBH+6c+PjPOwLw1pt/+DZU8oHtyrXcdrqN0dxagvCC19RB22L
         40oqe3cY2T6/SdI4kCWMfXU2qG6dbxolqkrr41uQg05/0aNA/UVnEBoK7gvwl7jP2FlJ
         ZJe/UMjryb12xrds4ZHXiEhJ5fZNFncFtvlVVYkwrY48adesUx/5NekKuXM6DRB4hUAk
         IeqojgTDdYTKAmIWv9KbuIxsHP9aXtCVaralYxj91GI5+Pc4wRyMQWabh/DL0t/NI/nK
         uy0cK5lrQ3NqstiYUEQW9qo9EdanqDuYzYevWoQFkTu1eUY+CnXTbnuqD5RYyl/moGGY
         h2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773689935; x=1774294735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qzlLoN9zjaPFn/rROXERl3fgzNE1uMnDS6xP6i1YjU=;
        b=mnuw7lLTjitjBU/obXWhJWlf9IThAnODOJdP81IolFm85GZqfIOUZKQkQOKyKJZi9H
         HgXCIxC5ctcDDyE4wVp+/84Pt4fHdbOBDODHdw1O4bzxbcQaYV+qxqXjrizWkayygVzt
         7vM9R0pUHpU15xFF8nrKPv6OnoE1uMEyCMyegKeJ7xR0Mp3hTibGbrUtsZ2DUTsDxh7J
         1crPnlDGQrYqFDVbNp4snna/bDrknAgWdysBhSA6ARxeS6ZXbQEpklroG/JpgT6dmo6D
         +8POKyIUZ6FH9rRQWPAKWVfkDBQ1uWv3TUzr4V7tp5J92NF3KGRTUxdTbn2J2/3fsdtz
         GqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm0aw+pFgunvWHDNQUdZ16V2BNBJbFEfdmPwDUW0Arm5cfMXvtBloeIqjnPbVAV2PvLWFmw2G7EodGct10@vger.kernel.org
X-Gm-Message-State: AOJu0YyTa9JhHyUXPHjyosSDF4w2XVeFcqSgVnV0IbyEujIrVy/fa4Jj
	ochr/cFehThBClbR34N4tgXP9+TqtO4BkcUp2/z8bSLAGgGDoErV32icLIHZxhQnRp4HZ8iuI3e
	CvWwKusqN/ls/d9jClUWpArpG/JkSz1uHD2CmilGnPV3yiRHdD9nQzyORNN7UPwti+Pmb
X-Gm-Gg: ATEYQzzJBhEyTAiTklDVo+3tgIBCjdBcFtPDRz111xsld/h+GrBFPDXAZQ/7+k6VRLp
	jHeFtJKFJOQBVm1sxqLwillPE69lRvhT4SDnSEinQiDnY5UVGbDSi0dmzomtO5i4uFmhtcC5MU3
	AQJG/RC6Tw8CH6N0VMFGJkjSCYMX/h5Ph9pBUvHw+Mn8eZgAtZlSgihMzbYKVx6JXaJqxwyN0zA
	mzwcPJ6yp+x6sC3prVdE0685M9gRkdEPSAe63utCLtmAzDSW9zK8LhY8AWoL4+o5eLLZKDxDSw5
	h+Ax/lAaOOX9Hi+CyOS8iXuvcbDalUCSUboDNmLJzL9N6cQBdC9sm/n4eHeiX0Dt5qxwv4ZLHDI
	1r4KYhu9Y6FA6vdkpxSioNndQb0Mgcy4l8/9e6+/6Ih1tQu8lS7LJD+ypTQOFHlewtxZBV8270Y
	KmzvBf7wH4CTbh6VupQIqRJPrhJxLWTBTOnRk=
X-Received: by 2002:a05:620a:4446:b0:8cd:b38c:4748 with SMTP id af79cd13be357-8cdb5acda63mr1789673585a.34.1773689935346;
        Mon, 16 Mar 2026 12:38:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4446:b0:8cd:b38c:4748 with SMTP id af79cd13be357-8cdb5acda63mr1789668285a.34.1773689934765;
        Mon, 16 Mar 2026 12:38:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a8c8979d8sm23819421fa.40.2026.03.16.12.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 12:38:52 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:38:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
Message-ID: <4gxuy4a37yr56p7ialwpovzjeizic522ttjqrsivx2murjyoy4@eolb2sdb5tq6>
References: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
 <2f4e4cc7-2600-482e-88d9-d4b20d328a72@oss.qualcomm.com>
 <drcot4oxpea5lnpa5htrrl2n6tcc4ocxmb5vsho3ocouvajwlo@6ueabivtjy4h>
 <7d8211c5-7b12-4349-a329-cfb51a918a1c@oss.qualcomm.com>
 <6qhpiiroqnpzg44i2j5rgmlw7uaffw4t5z6gv2kgubfoqpktpd@r7h75knlv5a2>
 <87a103cf-d066-4319-ab68-bea3463c0fa2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a103cf-d066-4319-ab68-bea3463c0fa2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1NyBTYWx0ZWRfXwB06gS1nYtf7
 nSxfvq6c0pyD0qNYLppjN2fe1bCrguq9eSPGnVe+U6EurNBo3kPfX3d1y95nbCu15sDNqONTzj1
 aymnkuK/S+qqixTnTrXmDK27SPXM1I1HMZb8YtbzFgcT3GkmTYJ9RtIFdgq8QdsX4VijWs0olaJ
 GQSLO7d+koKhsrxx/iRKZmca5wwL6uvlxUnHlyiJ35jpmHSx0MBIca9muFMqFDtHjttkYKa3H+2
 /JS7W+NGm5GcRB8Dbuvv/gN59bMrDr+zFr4F5ulSk6VxorbIPUHPmN+EGnX+FsWnQUkLWoqt5UJ
 u8XsrjJCi9+R/vXTuc5Tp6AkAIlQZl1HjPDaqQm523MyFb+/dOhU77OlqaZsbC6kWJHlSjlz1Qe
 1+8uR9Kj/MY0hLu5coizaYv35SlY7/m16smEeQFJIYewciV3Wk3DY1KCJln/1SQjo/UxPFbibua
 fX7xQ7XkPzIXuYvPLbA==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b85c50 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=f0SHeaQFhzeH4okAsOYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: WSTTtV7PDyuUxBXtaMWVYkYnNW3xWsXj
X-Proofpoint-GUID: WSTTtV7PDyuUxBXtaMWVYkYnNW3xWsXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160157
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98025-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
X-Rspamd-Queue-Id: 18FEE29FDA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:15:38PM +0100, Konrad Dybcio wrote:
> On 3/16/26 3:27 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 16, 2026 at 10:27:11AM +0100, Konrad Dybcio wrote:
> >> On 3/13/26 6:39 PM, Dmitry Baryshkov wrote:
> >>> On Tue, Mar 10, 2026 at 11:36:26AM +0100, Konrad Dybcio wrote:
> >>>> On 3/9/26 3:44 PM, Abel Vesa wrote:
> >>>>> According to internal documentation, the corners specific for each rate
> >>>>> from the DP link clock are:
> >>>>>  - LOWSVS_D1 -> 19.2 MHz
> >>>>>  - LOWSVS    -> 270 MHz
> >>>>>  - SVS       -> 540 MHz (594 MHz in case of DP3)
> >>>>
> >>>> This discrepancy sounds a little odd.. can we get some confirmation
> >>>> that it's intended and not an internal copypasta? (+Jagadeesh, Taniya)
> >>>> FWIW DP3 is not USB4- or MST-capable so it may as well be
> >>>
> >>> DP3 link_clock is sourced from the eDP PHY. I assume there might some 
> >>>
> >>>>
> >>>>>  - SVS_L1    -> 594 MHz
> >>>>>  - NOM       -> 810 MHz
> >>>>>  - NOM_L1    -> 810 MHz
> >>>>>  - TURBO     -> 810 MHz
> >>>>>
> >>>>> So fix all tables for each of the four controllers according to the
> >>>>> documentation.
> >>>>
> >>>> It sounds like a good move to instead keep only a single table for
> >>>> DP012 and a separate one for DP3 if it's really different
> >>>>
> >>>>> The 19.2 @ LOWSVS_D1 isn't needed as the controller will select 162 MHz
> >>>>> for RBR, which falls under the 270 MHz and it will vote for that LOWSVS
> >>>>> in that case.
> >>>>
> >>>> Even though the Linux OPP framework agrees with that sentiment today (it
> >>>> will set the correct rate via clk APIs and the correct rpmh vote for a rate
> >>>> that's >= 162), I have mixed feelings about relying on that
> >>>
> >>> Why? 19.2 isn't an actual working frequency, as far as I can understand
> >>> anything. Or is it a working OPP for running "shared" clocks?
> >>
> >> No, I meant removing the 162 case and relying on OPP to pick up the
> >> required-opps value from the next entry
> > 
> > Isn't it a documented way how the OPP tables work?
> 
> yes/no, there's a mention in dev_pm_opp_set_rate():
> 
> """
> An OPP entry specifies the highest frequency at which other
> of the OPP entry apply. [...]
> """
> 
> if you insist, we can rely on it..

I was sure that DT bindings mandate it. However, the bindings don't
include anything supporting that definition. It simply says:
  Devices work at voltage-current-frequency combinations and some
  implementations have the liberty of choosing these.

Viresh, what is the more exact interpretation? If we have a valid rate
for which all other params match the other defined OPP, should we still
define that in the table?


-- 
With best wishes
Dmitry

