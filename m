Return-Path: <linux-arm-msm+bounces-84519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E63CA95FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 22:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B40A43097BAB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 21:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5BF2EAB6B;
	Fri,  5 Dec 2025 21:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pt7QQRDL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SE2pKLTK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8960240855
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 21:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764969513; cv=none; b=NDQnz/WVYLG48MDU7hOIjt+r84+7vQggTWxQOej+keHEJFVcHfSwerde6C7JRNqdH4eebc/TjkTYba3MTx+c2DZTDuX5lQqYxyJKomsPT6BDheAHxNf4NIfbzOb92O+DhzScpFdOljR81jLbXgQx4S/yXMiNfeRW36e6Jr5w8nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764969513; c=relaxed/simple;
	bh=OQmNOK0T9ZXdEQc8/cehyDAVyeikjIROpANVn8D2dO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6y+QaFHX3AX/XuijSGacexOviBqsjtJJkOA2e1VIDYYdVYhvxSEUk8oEsUdlJaGtJKGZuGeCVOs75m+wiQy5n5Qbhs2ZTNSvFpKoQoGXNTJHYTtr3WhNEX2J+s4kbezEUNYZKMztBk8jPC1TWgckIhdB5J7k65Y6dcPlP5knkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pt7QQRDL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SE2pKLTK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBM1Y1077677
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 21:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZosTltoMJGwBcfEZDtPcQOPhxyBSQDr+QP93Z+sayc=; b=Pt7QQRDLVtWHabOk
	YlwRXQ6PG4Tbi8+U3JKilVsamaBYU0nalzPuBffSUSBy8fHz9wDng9UuPhujnzQP
	eWmw1J3qi4ExWoq41vnrZxZEP3N6DMa8TLN339TCl6GVE8b3quKA1t6zZhpl914z
	qW90YXyvnDj9Er8kjbHrhckLHvp+DCo7TYrBw+h058UhUQH7+kDgPUkWXyYBYLFU
	G09N19HWoo4QeJj/uI1SUnrqzluI+uEKLSkwSE98pvmTHH5z0ttUyjFcoezYSoNq
	CqK5nbEDg3nJn0TXkWO0KiF58YfPi3iVxTk4bK0Csqyzr/bclj2IplUZj7ttzZBh
	qLa3Sw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aupa8u243-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 21:18:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22d590227so328637985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764969510; x=1765574310; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1ZosTltoMJGwBcfEZDtPcQOPhxyBSQDr+QP93Z+sayc=;
        b=SE2pKLTKJBGOoGLBRHk9xmKinpfg7lIYUKsX7vkixFqYZVFLcvHNBwDXs8tavULcvT
         gYhowSpMDuY9Pyt8VxlONynJ0TbWM9RKJcjrblGOX/pJFdBXQ3H/KV6zMY1rGLCZmDwW
         HtKdgQeNv7xPDwumsgYe5hzRsE2SIecHRTCGIMhIrXxJEg+0N5tD2XZCR27Jsv+7Aos6
         //lCblXPWievlL4IfYcLVf+9zONNnHy2aBtlqWwprLjmAhHWIjv7/tpCSP/LJzmN0lhD
         Dt7aW3OOtdIl4kxSYfyjFbNjhBL+CjSypl3F29MG65Vy+0kySCl6s48XQfj8bjewtw1Z
         1KGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764969510; x=1765574310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZosTltoMJGwBcfEZDtPcQOPhxyBSQDr+QP93Z+sayc=;
        b=oTxhM7ju1uhnJ/VFu3vrFXd+RsmotRZ9rJ3rbtXj4a4vacgik46633Fb3j8TtYahkG
         qdv+j290ldq0QMtQZF6MJl5Uy6Iy0NkPdzJ08Di58kswprpePC0GEkjdnhaK2kX7MAAe
         rErvxHDWsElNV7sBK4/e/uT5hEmNptOG1DGtC+SWDbidZf+x5iGcVpaEcCf03IX4pFJJ
         wRYRDfnvhasDzlSevFKgo+tH2NZX/g995mT1aEFQtkcyrKGBhoJdlaHa7FXWxinU85wO
         Wcvp+TzqP63eDriP5/28XEYZRTXg4bBJIzf4jXEz9ipngN2pQeRg6h2bEmr0+KGCp/gB
         nHKg==
X-Forwarded-Encrypted: i=1; AJvYcCUdQUa7kv5HcDaXzMkkqO4jokiKLyG+M+hivxQBmw6F/z4g34LLw/WGoH5voJsowb5tih1MlqoCnHwFrjrD@vger.kernel.org
X-Gm-Message-State: AOJu0YxgSVBdnUEktE0Yi1dv5dELwJQTCeCl20qW99wLPUhQsADajtRT
	dlGFm5MqcgaDkcZ4bpFvQG4aP1KVAcwctOzaDxPCebYZakjKuFMjkNAJVeNQ7ZXM822QFH8Z0Cy
	egIJAlAs0K3k7kXjhIABHe5dgoazeyyB/DDsL4CclsLLL6AvC9rLyzLh9duu7xPzX+nAq
X-Gm-Gg: ASbGnctfdUJ9qgoSASeK3OBguA5QzAOK4r8QpsQ2fQuoznKNRK+S03Ecdz6E3XJFZUB
	dfrD3ItmOR9yOlfAaiMdZ/0w9p6GaSp8oDuiS3d/d6I3zTCtTuQCmrCwVHUSxUIA+hqjSCdcPMI
	GZ2kXlrlmzJjDvQFUvHr4NA/gWxoNfgIAP6MTBDJn+de/6v3nXZ+n3g0MMVVbGwlRUIjZGbIIGH
	2ZGuUXdBRtSAKp0qRQibbv5ltFRVBZs0UGUNDSfl7caEZJbozB8iGT/EyNmQ4KM3V6j2uxnoToM
	Ih8XnrDZyB25NoOG+15IhEYGYopHpZhWzdHzp6YI6LyNVKuzCQxUxwSW5N13KQukAdG57yw2Huz
	ZfDytUgIJkywH7CJa2fXY581r4EAUocEVw5kWX+OJEBxyGVOHKvZ0VxSdFjpEhwY7W0qeTcTX2R
	pGG/cLGJgHzP7bbbj5VOFpozM=
X-Received: by 2002:a05:620a:bcc:b0:89f:66a7:338a with SMTP id af79cd13be357-8b6a23511acmr87155485a.22.1764969509593;
        Fri, 05 Dec 2025 13:18:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYy0wjWIIVPo/nDX+tfJCaQBwG1eKSzJXBBie56FYYL6FTeLk6VZrqImRZjkTqCQFrx7sFnA==
X-Received: by 2002:a05:620a:bcc:b0:89f:66a7:338a with SMTP id af79cd13be357-8b6a23511acmr87150585a.22.1764969509045;
        Fri, 05 Dec 2025 13:18:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c283c9sm1815129e87.79.2025.12.05.13.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 13:18:28 -0800 (PST)
Date: Fri, 5 Dec 2025 23:18:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <qnpgm5zmiqvwwmwc4z64uqssodrkcjaai4ro5tt36wua2jljlv@y3dx5s2sxrlp>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <Ux4KioDAyhqgZYleT-eeeFKzuT_qadCIpP3RgyB40apZPX4I9_JwcfY9mebop4gmFcyh4LPw0KQvFzL4zzysJQ==@protonmail.internalid>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
 <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
 <623225c2-166a-49a1-9856-d02ed55f1e47@oss.qualcomm.com>
 <bds552pvggsf6jgfyghyigp2fb6zb6hucwqirwye5puctnrhdi@tqw4b2nc3mkg>
 <64dbe824-a94c-4394-8cbe-ebdb7a3c42fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64dbe824-a94c-4394-8cbe-ebdb7a3c42fd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=69334c26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=-hlWXENT-bs5vX3FMFgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1OSBTYWx0ZWRfXwurIJwpsPzCi
 wfZ27usIqxM1hghJhEwxzqnortoGpyFfdMvh4ZX+UW3p4JFNdmANcQa5drBHsgW7/fLZwMa4BQm
 m65KbxXP5K5oARyFTg/yoNGr0gErCxHV2hblPNQg+++9frJzW1dNOm1wQJ4cfdHcD9bp3Reg5x8
 1WjeLPtbmcpY0Smqb3KoXP8mR0f14sln79iWJ/Zy7R1/QKI0NErMUS1vvkWHMyDooposGzuhATn
 siknYqWcoZDQsa2xNoWa0bCODtMTc9FZ+lz7IoQEYjoYk8OeFZ0nOV1PW/CohleXPfhBK/1l10m
 1rSay2OLeXOpcE2ZZLfVmnOiFOifvGwXL7+m+sCC0S/0htDaAwq5qoSUxd/R7FngSQCgI6qxmDc
 KAbOaXGnelIicaIRlMTcVvZ7xHpb6A==
X-Proofpoint-ORIG-GUID: hDb0q5XSFi57iARJqRCrxHe1O5LfQZ-M
X-Proofpoint-GUID: hDb0q5XSFi57iARJqRCrxHe1O5LfQZ-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_08,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050159

On Wed, Dec 03, 2025 at 10:48:14AM +0530, Vikash Garodia wrote:
> 
> On 12/3/2025 2:54 AM, Bjorn Andersson wrote:
> > On Tue, Dec 02, 2025 at 03:43:17PM +0530, Vikash Garodia wrote:
> > > 
> > > On 12/2/2025 2:06 PM, Mukesh Ojha wrote:
> > > > On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
> > > > > On 21/11/2025 11:37, Mukesh Ojha wrote:
> > > > > > > Sorry.
> > > > > > > 
> > > > > > > Did we actually come up with a cogent reason to omit the video firmware
> > > > > > > loading here ?
> > > > > > > 
> > > > > > > AFAIU it is required for Lemans and Glymur - leaving it out is blocking
> > > > > > > getting video stuff done and storing up trouble.
> > > > > > > 
> > > > > > > What exactly is the blockage - is it something you want help with ?
> > > > > > I replied to you here[1] and given my reason..till something concluded on
> > > > > > "multi-cell IOMMU[2]", I can not add video and block what is working
> > > > > > already.
> > > > > > 
> > > > > > [1]
> > > > > > https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
> > > > > > hyd.qualcomm.com/
> > > > > 
> > > > > Why though ?
> > > > > 
> > > > > You are mixing together the issue of multiple SIDs and the original loading
> > > > > of firmware which could easily reuse the venus method of
> > > > > 
> > > > > &iris {
> > > > > 	video-firmware {
> > > > > 		iommus = <&apss_smmu hex>;
> > > > > 	};
> > > > > };
> > > > 
> > > > I completely understand what you are saying, and it would be very easy
> > > > for me to do that if it gets accepted. However, I doubt that the people
> > > > who raised this concern would agree with the approach.
> > > > 
> > > > I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
> > > > banks separately. I’ll leave this to @Vikas to answer.
> > > 
> > > Not exactly as a separate sub-node, but i do like the idea of introducing a
> > > simple iommu property, something like this, which Stephan proposed earlier
> > > in the discussion [1]
> > > 
> > > firmware-iommus = <&apps_smmu ...>;
> > > 
> > > I understand that we are doing the iommu-map thing, but a property
> > > exclusively for firmware like above look much simpler to me.
> > > 
> > 
> > "We know we need to find a generic solution to this very problem, but
> > while we work on that let's add this quick hack to the ABI"?
> 
> I would not call that as hack, rather a simpler solution instead of packing
> everything into the generic iommu-map.
> 
> "firmware-iommus" is much more readable to interpret something running in
> el2 mode, than digging into function ids inside iommu-map and then matching
> it up with specific SIDs to confirm.

If you want it formally, NAK from my side for firmware-iommus. Either
reuse an existing approach (at least it makese sense from the historical
point of view) or introduce a generic approach, which is iommu-maps. The
proposed firmware-iommus is definitely a hack around the IOMMU
properties.

But it's really off-topic here.

> > > Dmitry/ Bryan/ Krzysztof if you are good with this, we can bring back video
> > > in this series. Please share your thoughts on this.
> > > 
> > 
> > Please let's keep these concerns separate, so that we don't hold this
> > series up further. Even if we choose to go by the subnode approach, in
> > the same time frame, it's better to discuss it separately.
> > 
> 
> ACK.
> 
> > Regards,
> > Bjorn
> > 
> > > Regards,
> > > Vikash
> > > 
> > > [1] https://lore.kernel.org/lkml/aKooCFoV3ZYwOMRx@linaro.org/
> > > 
> > > > 
> > > > Also, I do not want the video PIL discussion to be part of this series, as it could
> > > > unnecessarily give the impression that this series depends on it.
> > > > 
> > > > > 
> > > > > That binding got dropped because it was unused in Iris.
> > > > > 
> > > > > https://lore.kernel.org/lkml/05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com/
> > > > > 
> > > > > I still fail to see why we are waiting for multi-cell IOMMU to land, when it
> > > > > is expected to and what the VPU enablement story is upstream in the
> > > > > meantime.
> > > > > 
> > > > > Blocked it seems.
> > > > 
> > > > No, it is ongoing, there will be next version coming.
> > > > 
> > > > > 
> > > > > ---
> > > > > bod
> > > > 
> > > 
> 

-- 
With best wishes
Dmitry

