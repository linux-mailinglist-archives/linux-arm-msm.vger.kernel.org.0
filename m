Return-Path: <linux-arm-msm+bounces-100494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKlcD3cPx2l3SQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:15:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F8534C3C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 259C83015711
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8B2376BF2;
	Fri, 27 Mar 2026 23:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcTmmcRL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grH314li"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730BC36AB76
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774653299; cv=none; b=nYzZyfpuR4m2jE1CdS0ZOfvCEP38ITmTcVjpYj/WYCZbvkBloYPsLFgXbEm9m2h7i9wp/GBl8NkP7ar8b0x7r9+dcoMjI2zF+QvWO5Ugr9S44WQyDI8D2Rdpd2mK3ZDX88GAPULuPUQ62GLIQCZ0amFPobbJRXAoFzfZAv2lARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774653299; c=relaxed/simple;
	bh=iHe8v475xr7luc+LXQVFWOWrtD7HGtTXZEZ7q2PA78g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxWLDXLWzXrj5Vw/kH+Ki+Cumqtcq1APmKjHqmK3o3AoxmcX6+9wlTdzXbyJlcdjXL7+5eMAOCGFtrx/Bl8YWV859qmZvBYfp/VkMzTX9DigahQmg+X8PxE1CT5qzekmUB3S6jwkQu8yDJJT4G1CiFdR3GNjtyqe6ezshXvqN6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcTmmcRL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grH314li; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN3rnM2410463
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fHD5ujHWESj6xyF9/eDmdlBf
	LsYSouT6WT2WwKD2714=; b=CcTmmcRLBwl0hnT7cAwxB3mBe/HOaNrnYRG2Hs97
	/BR2pTBGmSNPnbX15eUoLVxVO76aqfXGDroIsUjaZgkt5t4Tjx1RftDSvvwQPIMd
	JWaygR5ABjl8F/Wd0B2B0DpU4LWXijx2GCBEIoQqb/6z9YA8XXI3ZAS67MrUCbGi
	emnb7ShT8sm7vDIngIoALWLB7i3323k2k+TX6XvUsoZskYfh6LHHCFilPZ7Eyu9b
	fBouxeRDGcJKmvHCsgTZLe6pkH6OArSg5F8tX/+FZiJ+/EHXGP6Zm5uhBVIFWF+O
	kqZCEr5lK4NbMp4yw3qYbHrKZDv+nZkA8872nHC3KCYiDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vvv982w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:14:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093025ffecso77694701cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774653297; x=1775258097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fHD5ujHWESj6xyF9/eDmdlBfLsYSouT6WT2WwKD2714=;
        b=grH314liBCB6M+PxgZglXkLOnVau05TVhaWoFrT2wrWo3lcsopTEE0nmztYFXdVPr2
         vHNmDf/xGuvYKjbLlTdPIOwpvYIFCJm6em6b1TyvWSUFo4saqzgIhRxkMCEQ1KhxBME9
         toQG+Z2IbcE3ju7WHTytOE+dWnkCagiDD4K9Wg0x48jjeItWXu19hqmj8700SBGknrD+
         c8COvJMunf1dY/Xo7AEndjS78cniHwqu7VMBDGc6rEq3dRUsKngKA6aAcGZp/npQ/FIE
         6lsQgw2vINwIiccE0wKDW2JeZP3ObhOeSO1uVZcuD8yZrP1UJadA6NYEWBd2f1u8uPP9
         c/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774653297; x=1775258097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHD5ujHWESj6xyF9/eDmdlBfLsYSouT6WT2WwKD2714=;
        b=AGAYeT2y8j0zaARrj+WZoGJCX+hrXRqImg+r9myGl3jJbpCOUynOiSKLUo7AFXO7bV
         epYXfJPu8ewbxEfxag0jCyVH0nLubGvzXB3qK80H7XQCrqzsoD1cdkv7huAYM+Fu2fQy
         1k8T/KY36wPU6an7VkX/1dqPbCZuSFaFecQNu61xdeT+Z17STW3eOXAY2to0+p3dBUoM
         2Sn299zXWNf3ZYmiPAi1nBAkPz4juaHwEc5K7UyJuXGVUTvK1SzuBWKC+Eu4oWmi0UK8
         /QTnP0H7GAsVIlaWJAwWcklQpnMxPz/s4Fvf9UPNe4ifOq7/xF8C/+iFvUKIfWVMgT1/
         u8tg==
X-Forwarded-Encrypted: i=1; AJvYcCVg0SneJVRxBesZZTf7f1CZ80vvu7afCE2WQ3aWwhjrd8WE+c438jPQLJ6QGIYIFC0gnhMxnkzqFb14I2uR@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSQP89dZqoSM0nIae80vx2xiob48/rycwUVj5R9Nt4AvgceHx
	6ldpgihLcFKWUE1aj2LpmcGfN+vpIjfM/MBoVPjAYlZyABSWl0pJRWzBrjcNgSER6XGrSefOQoA
	R50CqTI/nD/3f2I6Y5qd7jys3O2qb0NSaPmXwZvU1crGrmz2hdjSC3mPF3CFqTTc2e4B/
X-Gm-Gg: ATEYQzzNJ1ivHgfekKKlOsTWW1CYT8w1Ei9D92shsjZOs0ZtiGl14V+j66s6+Jox2lR
	X1OidcX2uL1/vOGjM8J0duKEge9+ptEGPXG5pPZOzEly6tp+AlbENaVLdXoX9aEpyEa9mkdZiX/
	2tMY+TA2MpKDEgHWUBhblHpeDAFGFW8lChIhb1MuHWJTNiD3gkN4a7vnP2qcBpHI2KmP4eV8qYj
	sdXBMaqCwtns8jfFnQz7cn5DEMvHgO8r8ytxZoodkw5UA33qZWbijJBxwCsy6pVxnPZWtxg+eHj
	ix9T+1sFR8L+mGZ0/aY28v81LMxcuSCxRkE2k1xmQF5n5LehwoiL7fgA7E8Chp5RGpl0Mbv2kLh
	CVl0YwaDDhiGRm+rK6xTpBVrv6Q0ImXBpbqNdn9YqG/LvW5aDfdwvRFn02i7EA1f+cKeHN9jyC6
	cPHxNxF1rfhRK1ES5CK71BFcwrRlijNWbrkGE=
X-Received: by 2002:ac8:7d8f:0:b0:509:1ee2:69e4 with SMTP id d75a77b69052e-50ba380a5e9mr61183301cf.11.1774653296772;
        Fri, 27 Mar 2026 16:14:56 -0700 (PDT)
X-Received: by 2002:ac8:7d8f:0:b0:509:1ee2:69e4 with SMTP id d75a77b69052e-50ba380a5e9mr61182911cf.11.1774653296305;
        Fri, 27 Mar 2026 16:14:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931b9sm1321751fa.23.2026.03.27.16.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:14:55 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:14:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add missing CX power domain
 to GCC
Message-ID: <k5ny6nlsv7anpphujat4yypd56tgm2afz4wvonwpbtdn6fn7yw@u43opve6auny>
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
 <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QxOUmlFi4VYrJ97b-98KBg3am9gibyfh
X-Proofpoint-GUID: QxOUmlFi4VYrJ97b-98KBg3am9gibyfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MiBTYWx0ZWRfX6RYhOGVjKlzw
 sOB0RU7FgSibB/slwrtyPGyrsb471/Wlt1TO181uGyROAlEm+k6VGwiQ2J9rnf06Mh2baRsgbh4
 9hWN96xVuR4eY4EJGwEheZiotxKnKPsXFtgNgCcEZPGRy2yyHCrE24GNcLvW/D8fkqkL7l+mrQu
 B0V4E3RaAZ72whKdWHnLsQWfY/5sC1/o7a4gRlQ/HMIZKxRobOImVB1x1IOeLmCgATC8xOQCsmL
 0Xr7eLfLFhEt/AM69kQrLrBlZo3fDxIxXJzKW6lnIj2irRcqH7+qmZVHjRrD4LPrcDvUbzdIhKn
 kle7g+9jqn1yHmo9L6VvvavQsaJjtORvOVnROzK1FzDXcJyHdGmzpTT0lzPJNXPNXyfzzYuwI8I
 VAU3570I85wbaO6lxFTrqUJo7QZewtjQpMDEy8AfyaMWOOk3m9SgkaG8E8ad3WabwbnXjMld0Lm
 uneAYX/BlNV2VxNcgfA==
X-Authority-Analysis: v=2.4 cv=PL0COPqC c=1 sm=1 tr=0 ts=69c70f71 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hvCAL5AnRklPZhNa95gA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270162
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100494-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77F8534C3C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 02:13:41PM +0200, Abel Vesa wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

