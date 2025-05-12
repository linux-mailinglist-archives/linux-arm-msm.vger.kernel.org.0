Return-Path: <linux-arm-msm+bounces-57586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FF3AB30B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 09:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDA417A9E9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 07:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE2C256C75;
	Mon, 12 May 2025 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tm9kUkgM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22767481DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 07:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035679; cv=none; b=GZjMwnoLIUdhjeRKiVYikWf75BOL/OmfV2sv1208fAMIu7E+XG7w1lZ4sMxiXVKtEI44X76iSKTtASqbkEMu3SFRpooV49yKhVliBmeqI5OltVBfKnKOfsjLgcTNGv6N00TkN/VumB1pE5sbAdv+ME/4gJyba0caDn0tuByAnjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035679; c=relaxed/simple;
	bh=yZ0CGA29M3rcJ+MvhLe+QeIcohtu6StaRYQuN2haPIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiZQM//dcFg4Q1i/iZ8XAX8NFsnuX0wyKdT2FRlvRIx2BeRpxmpp9H6d7CHsXBMoCPbMPQY8/W8KviLSzQoDi73EA5LfqEeIM1e9KaDejc+uOaC+txZNZi49ghVaU4/Hddokdhx9zP+iRsXj6zb85dv2Wua1Yq7lfRparVN1Bbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tm9kUkgM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BNpCXG012302
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 07:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=07H7J1WxUG240fs/pO939g9t
	ouj+8gGhAGiadw9TC9M=; b=Tm9kUkgMjp9XD0j7794zYjC7Kxhh1QR6KXzGcaA8
	+43GUr4yz4Sx8zIBf6Pf0hjlZ8HdtTLqUTNtdqPuZdkVqs3fWT3Dz/X3Y0xt9U9C
	2QYkWYRPl7l9rJsiPFj6C8NcxLXwnNfmkBvHi78ynvvTpRzzCkKL4ns3fdhbB1R8
	K3VqOor2CfWQpQspWtEpBh9q/kNm3VsPg/csw6i5GLjRhE/SNRSas7124NPsQNWl
	kPH23mVKSkes+j+RKRHnRwkxXvJPwVBmdgnVqPl3ts9jRFg2/Bn/VLYItZKbF2dS
	ZvwPNDIpB1GIxzRx2+ELxYyO2UfaO8EgmX9TxPRmGfseWw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjkfmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 07:41:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3086107d023so4569059a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 00:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747035676; x=1747640476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07H7J1WxUG240fs/pO939g9touj+8gGhAGiadw9TC9M=;
        b=bCs7gAJYIFM2ZAY0VqfaiaUPVk+7MHO21x4JQomcHkN5jchZlaFs3LZ+pd3ciJ1ukD
         GJuFQYpYBp4LGvTpg7bhQU5ziqtmHFLusSmbbTxdZ6DIySbeA8S+92MxHCmsgSkYO4y0
         +6zLFjIb+tNsc/2zuBmlKOFtfqAAOgTWm43H6fTvwjxEyiCK/vsnVH24A6EtCErdEih9
         +xneY//dVwK9ggGLXtwAoODnaLN5fdRjsZYRWEk+nwRrgMPkYm7tGyYuPxwNVd5oXquF
         ZhFkfWOd9cpfuYFomBH7GPyTh3IIhEBCWXGSrw3xwvavPrE+UO0EZKnEDB8lqQC5few1
         SfyA==
X-Forwarded-Encrypted: i=1; AJvYcCVi70jl6cim1d/Koc63u6FCez4ZSchey8+ORGOTAvTnzqst4JSv7tyeptjQsPAtvp10v5eNJNY8V+KS0gmo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvog76e3jlNKXmOwvsCxYP1LSy3zkTvf9F+MMhT3nzMyhTrjB3
	gEhjYNAtS57rqRp8u7Blul5HGJcD1NTE3PzRp5VU2u81DIy6Glt8iwVJmNoaIs8O/bH8oDIhRt+
	BMy52hCFXGI303tuPZrl+18XFu6O5u07rqecmWKo63NQz6TnA8AKzDRU+ORRwPeph
X-Gm-Gg: ASbGncuLYDJkJIFe59iieiiolb3ejjkyI2uJzmJB4qE5vRajWKHHVdYZUkG3Kte0v+N
	6dJI7d9Gfb2aQDl/4ZABG3HUvpY8wzGWk55B5rA9GlqgQdnC8kHpNbLnIn8qGy+jepqBDZvYSV2
	zhYAM5Am9ST6/BUcX7bgWonUqT91IAUyhBSzZHiMBftb7QWeSmFCM1YqKC6Epi362k/pTNOqBd/
	r7KlPA7E9t+UC+3ybOvYvs6esYAbxdHBV3D80lrCMmKwcZFbhmPd3PAHpAb+YeKAp0J4dHV2m8O
	Q/aAePbTHxW0ofYfKJAM4ezkMJ1j
X-Received: by 2002:a17:90b:2d06:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-30c3d2e2e67mr21168297a91.15.1747035675992;
        Mon, 12 May 2025 00:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExWuL72ZS+7tugxJHglTxQK96hvhpMFxtO0vu/JY9uRC/XDAlkU5cQR07NvobNtlJ6mInbyg==
X-Received: by 2002:a17:90b:2d06:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-30c3d2e2e67mr21168238a91.15.1747035675558;
        Mon, 12 May 2025 00:41:15 -0700 (PDT)
Received: from hu-pkondeti-hyd ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e76062sm6007792a91.44.2025.05.12.00.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 00:41:15 -0700 (PDT)
Date: Mon, 12 May 2025 13:11:08 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, krzk+dt@kernel.org,
        robh@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        beanhuo@micron.com, peter.wang@mediatek.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/3] scsi: ufs: dt-bindings: Document UFS Disable LPM
 property
Message-ID: <852e3d10-5bf8-4b2e-9447-fe15c1aaf3ba@quicinc.com>
References: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
 <20250506163705.31518-2-quic_nitirawa@quicinc.com>
 <667e43a7-a33c-491b-83ca-fe06a2a5d9c3@kernel.org>
 <9974cf1d-6929-4c7f-8472-fd19c7a40b12@quicinc.com>
 <8ebe4439-eab8-456a-ac91-b53956eab633@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ebe4439-eab8-456a-ac91-b53956eab633@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA4MCBTYWx0ZWRfX1OzbVzajnc2N
 YV/8jp0TqLWbFNmlRskzvl9K5EKW3zJykd5rLKcjgkKMoZvUie2VawGt2xL/fEwEW2VJzlCc2x8
 MLv5RZI+zgcLzskHdUvEkhXe8O97Kx7Z5RDWgyYTlWOJFhESjrWxFBCeH4ogEy5XBoU0irDLx8l
 nIqOQr+B5otcwuOC4skqdV7lTrbiVu6eOpflWttljgyPJN0WZpdNYf1/6dZaul6DICTnZwvvKV/
 WZLVHOe640AMmXmwKeRcAu67tXdUrhbbVdDD5+M6Txb+Os1QliiRgtmiRltCHnJ4kVBh/VnM1zX
 LS83XFGmGFGvME2izRzt2MoQV96c427k/oY3+ZUkLV/52y9Lk8Yo3/jbWwzzzt3iwN+1wDvH4hk
 qGXA1tZN9PSx8JbV9eLNb6YyQ3Oz+TAWgpbpZyRS6Ts7VK/XT8cflZC87tDX1W9UNsrpjBgb
X-Proofpoint-GUID: LY-XWrloPn_34v7Jz27ZlCrkaKtdsIR2
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=6821a61d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=gDD5y9GCQ-Lx19kb1DEA:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: LY-XWrloPn_34v7Jz27ZlCrkaKtdsIR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120080

On Mon, May 12, 2025 at 09:45:49AM +0530, Nitin Rawat wrote:
> 
> 
> On 5/7/2025 8:34 PM, Nitin Rawat wrote:
> > 
> > 
> > On 5/6/2025 11:46 PM, Krzysztof Kozlowski wrote:
> > > On 06/05/2025 18:37, Nitin Rawat wrote:
> > > > Disable UFS low power mode on emulation FPGA platforms or other
> > > > platforms
> > > 
> > > Why wouldn't you like to test LPM also on FPGA designs? I do not see
> > > here correlation.
> > 
> > Hi Krzysztof,
> > 
> > Since the FPGA platform doesn't support UFS Low Power Modes (such as the
> > AutoHibern8 feature specified in the UFS specification), I have included
> > this information in the hardware description (i.e dts).
> 
> 
> Hi Krzysztof,
> 
> Could you please share your thoughts on my above comment? If you still see
> concerns, I may need to consider other options like modparam.
> 

I understand why you are inclining towards the module param here. Before
we take that route,

Is it possible to use a different compatible (for ex: qcom,sm8650-emu-ufshc) for UFS controller
on the emulation platform and apply the quirk in the driver based on the device_get_match_data()
based detection?

Thanks,
Pavan

