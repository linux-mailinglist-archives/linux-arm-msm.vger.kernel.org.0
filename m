Return-Path: <linux-arm-msm+bounces-105684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNlwBs9v+GkYuwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:07:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 749AB4BB6AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60A243014134
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F26F38D6AD;
	Mon,  4 May 2026 10:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luhOo5YJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQQ8x7Wj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB8738F927
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889225; cv=none; b=r+dK5IB3Y9iAojXpiy1/uAkDp2eCs4kzUdB34uAnTLFnvGYteMVBeF+fWuUpxJ9xo42Bg++buA/LhG+sq4oT01eA7gHO2D/hF76JemUw+0W3OA4dPM4DtqvXD9s/t/EKnnW9LgURDdo9uScyGkCSdLt7tXJDyoMPXRVltyallMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889225; c=relaxed/simple;
	bh=m4u5RP8z/VNBBI2aGqp4lSMkp4CmLcfjlrmCx0dJb0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qR+r7u2EvyLSHdz2zYj0Dqg63JxU1tb6XRPZtftj3ZLkX//bAFBXe6SjFUfaOezm7wiJBqyCYKYDMU+s0oFNDaIM5JLWfOvwGx5QFssT0vcFvFVIN5Fk02s3iVFLv4OdCEiuOqzfDL+p6qqAEFfLvY7fPdJx1d9wckr5L7QqjlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luhOo5YJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQQ8x7Wj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644A6s6w4005861
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SS/LRHdKuv5gOfX9bsctMLkVp60IIsb493O2lALLVVg=; b=luhOo5YJ4O51VOdY
	ZtpBENMFp6UDsHRNrT+7CmnoVkQw8SSBANvek+/tpx3AzvumEQ2VwMd4zhHf/igl
	2IJEMscL9K7MOLA1n+3q5ypZBShQGUNIRKGa0kO/7UqFTdhFuYNTjyWVFgvL7r1+
	gSpmhYgUYuU8Y9CuAulEhHzjoVZQUeLmznwzj1T9ItHt/qn3x3VtBv4VnX22z1/V
	SxW2vVYQDUCCB/jUa1Iw4HkPZeCxkpU5BF0jQmxP8PXhBA1zC/Hmq1FEnGU2gQWi
	dRKwbg7C8cMCsrIG8swy12R8H2qE6Z84nkDSAbjkmxVX8AEMOa1p1oDUOZhSrBWf
	m1IpKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw0015-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:07:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d6bf346adso63798471cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777889220; x=1778494020; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SS/LRHdKuv5gOfX9bsctMLkVp60IIsb493O2lALLVVg=;
        b=EQQ8x7WjmdbvZXBABDi4qOMeBNi3FIy7T3tKTJOIMa4SoXwPI5sJ/KUuNt+YZgfHQ1
         ZCJtFO1MTbSyNNr/PqAbe0gx8c35uRCcgQUb4aG7L+sJSwPV2XOhkv/DPjz3KZpSnRhi
         ucXTUfs69c9X6TJhE61yNV7LLGmbMpqoLE+zGibPNdTQ0uulirKSB1+96rYEZ3mpM/D7
         B//s2Hq+Kttf21g0MWhY5G/hBUHaAP8PSnQGiOB11NylWLWYGzVpApzhnsJdWLeXHLxS
         rbolkMtUNnkNrFK53rzYbQEmEd1VYaAQAdElv9IT9gXAWoBYW1pdEzwNQwv+oTaIlmzt
         eFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889220; x=1778494020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SS/LRHdKuv5gOfX9bsctMLkVp60IIsb493O2lALLVVg=;
        b=C6HcNrJ/zjPkSlnDqoU/NTMJn8Tr69902/PPSc0ZkYLp3HiCnU+RumS7cfR7EsgKxk
         sOM6ovkfb0N6dCpD67DfzdH4VjakUOchsJZgW6oX8IGeExrFHMBea3tjHmYA50Hs00C6
         pUMwoI8UAMkfRf6X/tV4Rz+Yq+u0h0yxZCtlMaoRNQ2i/2Abz1Iq2zBepuvb3OGGxbrC
         aFJwKzAOBMbCzwQWAMq8LAuoFP36dUWyibPwkgUyy5BWHNFA2nPyq04oKK4fgawGcUSO
         rKE2av9HJKLqvupFmnDD42wyOXdm3YneW8gvdYEgj1KeP447gUHgLGuCXaf9AamzOOPb
         vE5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8G7/JtuZd2/903faNNLfHEMEGV48+YdOfZ1EEGtSYe+zH5miPHf7140csRKsy6bDXITJMZAaES0ssPtN+Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxEWBK7IkN+S5pm7s9C+Hx6VNLn9btFGM1XhY7B8ooZFff9shCE
	xIT86Or5nM5eudvLBBZ95JDH9VcyQKKV4/MhLiHzaXOLTSHlhUVRoZuPt9e2OF37ZcsctmUtTJV
	8hevpG7Cww4zEPf/j1wLmAt6F6qot2/q2YRRkIVjKVVkasRq0+i0WIgLz3CnhrZnOgNaxraXuQj
	ai
X-Gm-Gg: AeBDiessnpPhTkxngQ6IJ/ArMqJxK8u9w5bVAMbXcz7bAt77uKeI3x6LxtC6bh1RxgQ
	udPB0elbL92PhcEMSZbqWuXZU55/C9CcMNc3HwJvAkzfVte+ETXpyYrjYAgFaiEAoT6wApkr/au
	l16gk9Ix8vGEiIOK+aLaGRd4aiGthc09ZRIWLzhFZ13p3vNA/1Emf0hIFSm9JK0UZ7Q6uqnnbdN
	xpO0AO0/IkMQ2PnwkztohCFBocNRAS5U+mAWx55Bsb4loIzlqheuq20r5hp0xwAIPNmkcMai3qA
	Bh/Mz1X+FAowfTpxOouEAbAH4ucod5UXhCQ72A5Sxy3C2chlnid0q1CUZlFpRdg9CQzrOr/bBRF
	fV9zBaijr6BjdNVCjKNwfPeHgraUGvrM3yRPS525Bb3KINaE=
X-Received: by 2002:a05:622a:1791:b0:50f:bb01:985e with SMTP id d75a77b69052e-5104bf5260fmr123922111cf.48.1777889220074;
        Mon, 04 May 2026 03:07:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1791:b0:50f:bb01:985e with SMTP id d75a77b69052e-5104bf5260fmr123921701cf.48.1777889219509;
        Mon, 04 May 2026 03:06:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm559626795e9.2.2026.05.04.03.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:06:58 -0700 (PDT)
Date: Mon, 4 May 2026 13:06:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
Message-ID: <duuley53qaykn3m7nb3k7mfnwsmdzfq6qs6zkek4iyymil55dp@azjudm4quspv>
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
 <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
 <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
 <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com>
 <5c7d64d6-6fc8-4323-894d-56d1dffa7d09@oss.qualcomm.com>
 <CAEiyvpp42MsK_vr1kw86KZUWtP=VWCTPWzCJFdq5Qgd2k91x0A@mail.gmail.com>
 <3886cbd8-be29-4aa4-8331-f5b9a2e2497e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3886cbd8-be29-4aa4-8331-f5b9a2e2497e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f86fc5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cvdK-d9LoktiBtjlPlsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: eGXmaO9sgD35mNe-21dFsjVrxUX0BYyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNyBTYWx0ZWRfXwuupMaZYbuoD
 nVAtNb7kGyBF4BThXXFdKsj7DLs8OKqi/NSpH27uiC8Cma6/OWULI5axnOKvBvAdBdioeA9yeJu
 ttnl3/P2xsdeVGASkwDyZG8ftsq40UnZHiq4ELtmDog6twa2NsvsEvsUG3/od1/uQv9ZtRxgHLv
 lTzH+RULTA+EEEPk1HgBMDoQWYtxKJQIMjIjlZy0liNwSCW5G4HYJpO00PQaJzigTkjqlQ6PpXx
 IteCvD02Iye23y6lXT2MPt5uo0Ulwr5ZdMDv2Khw8hR+1IjD4iw8pk+AexF22AaG1uMpMTN5XKe
 Y/bmJrmDd2qDvENiW61vROeASaZOv28+YVrpJqV0FKMheMrTdssdcoi4AWng6mffNctM33MfJw8
 nZXVsGPOUGSlSJQEGqHFqK0dRo7kMAs25WkxHnHLTaNgAOYGvuTXQi7kEsMy7OCCGTfDkms0Gg0
 ZYGzvmEva91hCcPS8gw==
X-Proofpoint-ORIG-GUID: eGXmaO9sgD35mNe-21dFsjVrxUX0BYyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040107
X-Rspamd-Queue-Id: 749AB4BB6AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105684-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,a600000:email,88e3000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 26-04-29 11:45:10, Konrad Dybcio wrote:
> On 4/29/26 3:57 AM, Krishna Kurapati PSSNV wrote:
> > On Tue, Apr 28, 2026 at 2:54 PM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/28/26 7:46 AM, Krishna Kurapati PSSNV wrote:
> >>> On Wed, Apr 22, 2026 at 3:55 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 26-04-22 12:09:31, Konrad Dybcio wrote:
> >>>>> On 4/22/26 11:41 AM, Abel Vesa wrote:
> >>>>>> On 26-03-31 15:37:08, Konrad Dybcio wrote:
> >>>>>>> On 3/31/26 12:37 PM, Abel Vesa wrote:
> >>>>>>>> Describe the ADSP remoteproc node along with its dependencies, including
> >>>>>>>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> >>>>>>>>
> >>>>>>>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> >>>>>>>> combo PHY and an SNPS eUSB2 PHY. Describe them.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>>>>> ---
> >>>>>>>
> >>>>>>> [...]
> >>>>>>>
> >>>>>>>> +         usb_hsphy: phy@88e3000 {
> >>>>>>>> +                 compatible = "qcom,eliza-snps-eusb2-phy",
> >>>>>>>> +                              "qcom,sm8550-snps-eusb2-phy";
> >>>>>>>> +                 reg = <0x0 0x088e3000 0x0 0x154>;
> >>>>>>>> +                 #phy-cells = <0>;
> >>>>>>>> +
> >>>>>>>> +                 clocks = <&rpmhcc RPMH_CXO_CLK>;
> >>>>>>>
> >>>>>>> This is TCSR_USB2_CLKREF_EN
> >>>>>>
> >>>>>> Good point. Will fix.
> >>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>>> +         usb: usb@a600000 {
> >>>>>>>> +                 compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
> >>>>>>>
> >>>>>>> Does the device suspend and resume successfully?
> >>>>>>
> >>>>>> Well, tested with pm_test devices and it does suspend and resume
> >>>>>> successfully, but there is this:
> >>>>>>
> >>>>>> [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
> >>>>>>
> >>>>>> But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
> >>>>>> all platforms that have them.
> >>>>>
> >>>>> Well it's not fatal, but ideally this wouldn't be there. Maybe you're missing
> >>>>> some DWC quirk in the list, although it seems pretty long already. Perhaps
> >>>>> Wesley would know more.
> >>>>
> >>>> + Wesley
> >>>>
> >>>
> >>> As per HPG and downstream, this is what needs to be done while entering suspend:
> >>>
> >>> 1. Clear PWR_EVNT_LPM_IN_L2_MASK bit of pwr_evnt_irq_stat_reg
> >>> 2. Clear PWR_EVNT_LPM_OUT_L2_MASK bit of pwr_evnt_irq_stat_reg
> >>> 3. Set the following bits in the pwr_evnt_irq_stat_reg:
> >>>  a)  DWC3_GUSB2PHYCFG_ENBLSLPM  and  DWC3_GUSB2PHYCFG_SUSPHY
> >>
> >> In case that's related, most platforms (including this one), set
> >> snps,dis_enblslpm_quirk which prevents the first bit from being set
> >>
> >> Likewise, snps,dis_u2_susphy_quirk for the second one
> >>
> >> (although it looks like setting these bits is currently
> >> unconditional upon suspend in HOST mode?)
> >>
> >>
> >> As for the sequence you mentioned, I believe the diff below should be
> >> OK - although it _really_ just adds some delay vs the current state,
> >> since the bits are cleared in the resume call
> >>
> >> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> >> index f43f73ac36ff..e7b1775b7207 100644
> >> --- a/drivers/usb/dwc3/dwc3-qcom.c
> >> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> >> @@ -12,6 +12,7 @@
> >>  #include <linux/module.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/interconnect.h>
> >> +#include <linux/iopoll.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/phy/phy.h>
> >>  #include <linux/usb/of.h>
> >> @@ -344,10 +345,18 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> >>                 return 0;
> >>
> >>         for (i = 0; i < qcom->num_ports; i++) {
> >> -               val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
> >> -               if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
> >> +               /* Wait for the PHYs to go into L2 */
> >> +               ret = readl_poll_timeout(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i],
> >> +                                        val, val & PWR_EVNT_LPM_IN_L2_MASK,
> >> +                                        10, 3 * USEC_PER_MSEC);
> >> +
> >> +               if (ret == -ETIMEDOUT)
> >>                         dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
> >>         }
> >> +
> > 
> > 
> > I think its best to set the DWC3_GUSB2PHYCFG_ENBLSLPM and
> > DWC3_GUSB2PHYCFG_SUSPHY here as well based on quirks before polling
> > for the irq_stat register.
> 
> Hm, it seems like the dwc3 core layer only does so in the suspend
> path if dr_mode = "host"?

OK, so I guess the quirk list is complete then, right ?

Lets unblock this.

