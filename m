Return-Path: <linux-arm-msm+bounces-97128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG9QH8NGsmkCLAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 05:53:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF4226D3D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 05:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 888E730406BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED53339B975;
	Thu, 12 Mar 2026 04:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dchCiEM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FH4PlfAV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2BC39A05E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773291189; cv=none; b=fRkaBUDiUkggoLHrGlvaxooKjRZQ1kCIJLjYU+KiosCxkiliBwbNF1DeynATrd/1GHr85wLztAFjlJvve2Ijw6kse7wCQvS/eQZzcMGxW2dXtZ6ADUMZBK1KbOUYdmEz0jtUG4L2HY+ZvajEFVpcZadimOs7ULKj4l8A+T9uSjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773291189; c=relaxed/simple;
	bh=lN/KbGQqw23Tc2KDnTrwaaYJdfzwqq6mDA68SJrn/qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeU3z8xd8eYQY3bDPW9/z9tGgj7O+XnA/FiVnhki7UnhERBnOLi85Be04QLzsXgKjvdJ96A26weojfbQTj3ra7SO+NMiIKTlAuqT2MPS8WP+ZqeJ7MZlSQ800OuSk9i+zk7bZKPk1cUyvIUIcA/gwd0ssLmhvjSfXq28PcBW4Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dchCiEM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FH4PlfAV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMONXw4028372
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jl8minE8nYKp9+OT5OcDwwB9
	zbvmYytTY2026ml5RWM=; b=dchCiEM32H1zvmnyTX/vqHJhwhPXOd1shQZkhVW5
	V6JQK1FWz/BmIBAEIbi4Z2Z4wiXWxVZu3Hp/aRq+HAj4zfh3q2p1Az1vuY68V/xF
	/C785FdLoLRzk9VQPY56W2PM3wGpvasy3MCx6w6dUvphruf8VSpg1HNrnSIi780+
	qPIBjwU7rCj0FFs4XnAMBQStvoLjYMDRb6q0ibyJNRqZfHCzFoqVhpchbOjRHtTZ
	O86Qjc+g7ECZWed9AtjfiZNfaqBYy4CuSOy0qWwNGniA91ioKA6Nbe0qvdxnz0/T
	Ins1Kjn5mf0sOAlMXL7GiSUhjwG6VR6/+dHI2YqG5GzLEg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54rwad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:53:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899f6e5b909so66985726d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 21:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773291187; x=1773895987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jl8minE8nYKp9+OT5OcDwwB9zbvmYytTY2026ml5RWM=;
        b=FH4PlfAVx+Zn317QI9i99LL6AJKOy6emI2z+8SF8AyM0nfPOR1luf940F5RNfVpFF+
         fqfB8o4LT4vU584vSwsAP9e2op4KVEGLhK5KDiq5e3zRPeNfG0PAELjDGOX0/dINioUM
         mtai9JKZqUuj6IvVcc7ML1UBASnCnZle3TQEYXe2J+5k+c1lA5pJPGSkSlkzycK+NxLN
         o2loj5SRYQLNT5gkwyWnmq9ot4qEiZEi2x+X1GofYXx7rrKTvzipxK5EsOE5LvE2IIrN
         CbsUNwQlE+ac3zozmSHIej9oLTEc6rPezsnIF9IQ1zUUztA1YmShYW1xECdPK5hHE0hg
         N2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773291187; x=1773895987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jl8minE8nYKp9+OT5OcDwwB9zbvmYytTY2026ml5RWM=;
        b=r989UFckNsyjJarTcnUXizz5mfamweF2zNayhG6jMyFUATDgDwupXXq6Ba4SVn9bw3
         kVNmtHS1t2fR9JDSiXgjQDnjeTdE4p4ZNVHcgAD1WBQ3V5XRavT+kP7pZZudHu8/LT/G
         ya3xAdVRgcjYtF7wSGvu1BPVnw74WV9FDoPNPw6GdoLzO2q8lW3GFFnBRtHuqLkYyihY
         MD0MorvCDw5KOhg0nbaoD8m9BubHwdhecpTXckFGF2aalY+lcaaSHGso6NewDZLkrpLw
         Lge5968jj6eYCwpcTuVY2KTBxGorSS9M9k/GOF9qnXOUaYMWCrUP91S2AvzeNVNvOkzw
         Iumg==
X-Forwarded-Encrypted: i=1; AJvYcCXt4JPbPbK3Tb2lgHA4HkNmp3GiZ0QVYRQ6rY3GaP3AqPnGqTNU/pvfZVET8qhsVTG26nR2/8zl3fBsJYIm@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIDsQ5vwZn0Nqacp/rNlTVZhPdWb2sRtOzHNp/cCzKoKPHvqy
	aHGJ2uAxNq2pFw5YSCOmeBb/3kJCv8uBMjf0B09PCSkKT4dJCVqGzMohHUagqyrRS92tUGUCLph
	HzgIZ+J36qsUwLR/xqAJWuVdZr1PFjC2im/ldRTzbBIOFArEcKH0QZppX+CyMuptg4pUN
X-Gm-Gg: ATEYQzzSXXelY08znw1WYvsV1y6qrIV/o/2MY2DmQ7aXnq+Pu3UzEISRAiGRJrBTDyv
	g3ZIa/4vXb1FoQMnSC3BQquRHeOaCWz2nadzVoo7Kcl0MTRh1enfb1bv/xVB20LOvo3mUqjLssF
	P5AEbNuO1Bmbm143bqJpHIAVeFAALFKIyeERoqUQf79YYyJ2tJVJAcaNkiQ49AocGzyvlp8ksHL
	19TRu7va8D8vlFoJRVgmsq03JP8rIUKMpGj84x2YjtnPLufigX9Zz86trrKRCqyz2uWEuc1Ag41
	r9kipbiCea4FC+5kKOZagbeSQwMyQTyY4dlSgs9y7VjUMKOIx+GP7UmjcCZy+twfKlQou9jiEey
	6s9c87uqFAsDwBwBGPUm93S3btaDGlxG33R8uw++LH2ljLmBUvX42uPDCGEi/fSOhXsjHprhxyQ
	CSux9it3nHo1sBJm5xUutzOV34oxzWu7KIgzg=
X-Received: by 2002:a05:620a:4153:b0:8cd:79aa:693a with SMTP id af79cd13be357-8cda1a56db3mr613114785a.67.1773291186605;
        Wed, 11 Mar 2026 21:53:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:8cd:79aa:693a with SMTP id af79cd13be357-8cda1a56db3mr613112585a.67.1773291186087;
        Wed, 11 Mar 2026 21:53:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15603487bsm739851e87.41.2026.03.11.21.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:53:03 -0700 (PDT)
Date: Thu, 12 Mar 2026 06:53:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Message-ID: <tpoksnga6erjhoh37vohoqw32fe62wbhjg74tvulgyn4jt2nbi@kamwahlyuqvo>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
 <oqvq52az6iknhg4negqaprfsx5dfo527acoeas3tusqpqvak2c@wrdmsydyy6ns>
 <20260311-unique-daft-nightingale-584252@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-unique-daft-nightingale-584252@quoll>
X-Proofpoint-GUID: eDDljj8hMddWT71qM9MtsT5kBtywJdR_
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b246b3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=n-Yar0ZZng0pcsCwfiQA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: eDDljj8hMddWT71qM9MtsT5kBtywJdR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAzNiBTYWx0ZWRfX1G6UureiQpyC
 kfyvufalIbLuX131VJQytR+DAYIMPIVM8FH7LCSbeCUtIwFDW2KzTMMiWCt727Bad8Azm4E7eMd
 kgk/SeMtdyLGcupGqenhb9K0+Vs72yUICjfW0ZT9qOoY3/qbIOA8POrd8mDUrL7OfEAJipvdc7Z
 Bn5XW//zr1onpmzfl7FltiYOr3jeZ1/iWhtpXFqRgns48jpZ4LK6s117EQ0bH26GGLqDpowrIMF
 9Orm/ztBWUERHtj7Q2Sdp1CLGvbVM4X5v7FS/W0SHmALFX/1HaYdmf7H8Z66ElZmEH5511T7IJA
 Qjk7a6SH+toTdZ3ma3vKMD13GfLAmQSWFLpvdKNjYXGDXuGvbwFv8ivnInaCYIj3p4rK8+kISQZ
 UWer2veEnKeAj3aPerMmmB9BIBvXSPAc0z/cLRVfOl+fm8uHBzObZ2pUPNKXHxpgHCsvenBnLpq
 5fxFtlrUWL60qYaZl6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120036
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97128-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DF4226D3D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gn Wed, Mar 11, 2026 at 07:26:38AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 11, 2026 at 04:04:09AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 10, 2026 at 03:03:20AM -0700, Jingyi Wang wrote:
> > > Document the component used to boot SoCCP on Kaanapali SoC and add
> > > compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> > > the "qcom,smem-states", "qcom,smem-state-names" in the pas-common.
> > > 
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > ---
> > >  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
> > >  .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
> > >  2 files changed, 159 insertions(+), 1 deletion(-)
> > 
> > With all the changes to pas-common, what is being left in it? Would it
> 
> You need place for definition of properties - smd/glink-edge and
> qcom,smem-states. The latter is actually not properly defined in one
> place, becuse there are bindings having  it but not refencing
> pas-common.

So do we for schemas definig smd-edge.

> 
> It can also define common order of interrupts, but as you pointed out
> this does not work for this new device anymore.

Nor does it work for SocCP smem-states. I think that having such a
pas-common overcomplicates existing schema. What about splitting
qcom,dsp-common from qcom,pas-common with the latter keeping properties
that are common to existing DSP and SoCCP, while the former being used
only for DSPs?

> 
> > be easier to leave it as is for the traditional DSPs and copy necessary
> > functionality into the soccp schema?

-- 
With best wishes
Dmitry

