Return-Path: <linux-arm-msm+bounces-90609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDkWOi2rd2kZkAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:58:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2038A8BD4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FB58305ACAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9741A34A790;
	Mon, 26 Jan 2026 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozYJbgBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPsEgk0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D76330669
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769450030; cv=none; b=LI//Qzxt5KXBLUcxKNUXgShp/OgBpVQUV8APUaBbiqarNh1lyDjR+KTrb5FfKklBH9c4Nz7LMWlZW3ma3TI/8BHENY6WP5/aLgTytzS3zGUtD2aQUK8o6cQzaMpHSRIP4/VMxISpsY50f1pv/c90+13Fu1cFMFCTqfG8J+X+YRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769450030; c=relaxed/simple;
	bh=68bu/A4u6F0RqdRU4MkCUS4Y0YuGhpHEKejqlCtSujg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSy/b2yOxMAu+r85hmhvuzYWsBCmXk1IpQtMx7ZG2lsoRp2S73jGYBXhtpkpAD8p5B4Jm77eXxXTD7GD7Xtljqa6qkIe6/wyh0co9gwanCDkhq7BUZxfJE4F1biTGyf0xv4r03TEKDeSLd2tS/hKbce3okocXtGolxzAIqU/t+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozYJbgBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPsEgk0X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QEqwLh170778
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=La2IZRFynLoGxCtFNU0StQ3n
	vumaGUyS2ZbSeRxbKnM=; b=ozYJbgBl0CVFus5VotZ3kizusHuThmqt3mmNRaZB
	yuVbXmX4wQ+F5RypEEECGU1mIgqii5ErRbLJy7o4fQuhMLNUBxgR4z6e0aA2FvOt
	Ris/w2QqBMhquH8rm4hqCe5KepwTIuwG5Labk5XGQI8IdOWuXSH9NANUw+Lk3OEP
	4McHtYRzv4dOMMbA4cF+EhmJtq/TMjCwrkllS1Qo2aie//i8KhWkGNh36Sduy6M7
	upoCMvEE3wueDHroPJKYel6yItCPRrW1Fw0HWnRWS1pfpORbeg179267V+NYgken
	zqdytHMp+do8qWpvebit6N/0oIZWSqOdiuxq7A7dRS9fLg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxadprhrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:53:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ee83da1811so21615032137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769450027; x=1770054827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=La2IZRFynLoGxCtFNU0StQ3nvumaGUyS2ZbSeRxbKnM=;
        b=CPsEgk0XcIdoJx3V3aKesIoyRShUEgpjmda00AutsNagErrA9423+pLt9DX51gzv2p
         aIm2HFZi57civ8/YImRLL41VqZ/XCYnRCzp0qpHnJnnuInx7XS0HfsvRWOuQkMoTHB7H
         IJzUVAy1XItasni2Tjo8q9wOsox7azPsPXe852c2wZeucDSkVQEKIIWTAv/7BcCeP5W/
         de+8JoiqqvxgMOyXPH1Wkvek3sz01FXcoOMNF1Ef9QJTbYfTHqvhYxCUdP6N1rMSVqaG
         AFUkDaVWXsOvbl4U9ZPkvsdmdofHeotfbR2snuWiTCJp1wF0eACwlPhBhUkUltYaynMa
         oKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450027; x=1770054827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La2IZRFynLoGxCtFNU0StQ3nvumaGUyS2ZbSeRxbKnM=;
        b=M5ubcmXcshk3RVSCMOuLN+H69/7M2xHhdAnUQjdVpUfPW+o0ahDXUc7i1xov22XqGO
         xtKELFb317H9ar2qCR9jkA7W7E5XTYaRs9x3wmfZvwoi4KEcqqq2fq8TzFsaqGjMOyrA
         LXW6okX2RwaozhEKjBvd0Ut0lucFa0M+f5jHgqU5GHZ90ZK2Q2zl+NBBz9EFnLswY5mr
         DqNwzCrjQZ0LVgr+KNIGK/zE/FtE+XO6suryI0oy4tPOxaP8EBBLhj+TekSdCK5n6Yt+
         BSTgA4AGl6tYq98dczZOMjvAf0i5nEjwBMwSvQxst1FEh7b0K4j2RPLR0w8npsi7JHX5
         ZEbA==
X-Forwarded-Encrypted: i=1; AJvYcCUZowTOOzPAAN3vLsFWs+Lwh9J0zP48tAAh9RTD2PBjcM1eGiBUrppNmteello45Q9IdDyEtdql5THxR5TS@vger.kernel.org
X-Gm-Message-State: AOJu0YzrjhHbQMXvEwVJZiiFeUx4PidA3afhDcHEejudsHcfbGE2qR2b
	/+oAYZ3gpqfovfwEGR0rP7SVDxM/z/ylplnzVziOl3xiVr5n2w489oiHqKAYFEJ5oicVl1SyTiQ
	CFco0vbrF8gEtnzE19h3/lRahrndBfWWbFv6qiOkV6qzS4YlKjnkYveVUpoCvHgWtdAj5
X-Gm-Gg: AZuq6aLXWrW1C3f7XtIlZz4z42ewJwNgt1Rg3+l2lJB7fyS+4TupR61wht/7FDJlnY4
	9UCAUAj8IHxn0DtgfuuH3PDDm+klYtEjikrgatHzWsNkiQjMw+aTC/p0Xt+VhzdXRilL/gwJkBx
	tagYXfeTZ+Sz37E3y18uh6NVCZ3BiQev5wvGn8UPnHaf5G11RtMJrTKeHZbdEaMmc9hnA3Yzfxj
	3cEiJnfEwqb/crdcvNCXOZCNr23cVqUAmCUmGlBb/vkawiacd9xWAZEe66Kj48FFM8n8QFtZpkU
	vjBVUeSFn+39N8ExFTKl43ZKcUwszx9AgStUzuBh2PUCND6nTEDOxQEjYTyw9YizOjng4DY058E
	S3EgNpheBVMlnmv1bzYWmFVXTBFPOe+Xi9F34pnmpN1K2GXDrs/m22akmHmsDnK8z/KVGGF1npk
	otWJ9tJjJivxwR1mEQppcEjY4=
X-Received: by 2002:a05:6102:304f:b0:5ee:a8c4:18d4 with SMTP id ada2fe7eead31-5f5764ce5bemr1796140137.35.1769450027382;
        Mon, 26 Jan 2026 09:53:47 -0800 (PST)
X-Received: by 2002:a05:6102:304f:b0:5ee:a8c4:18d4 with SMTP id ada2fe7eead31-5f5764ce5bemr1796133137.35.1769450026988;
        Mon, 26 Jan 2026 09:53:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492cd32sm2836715e87.100.2026.01.26.09.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:53:46 -0800 (PST)
Date: Mon, 26 Jan 2026 19:53:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add missing clock-names to GCC
Message-ID: <pjambgdh3fh2ypbun5qnmcpwrz2ajbiulcz64g7epegjy2j4eh@a2zkzepj5ro3>
References: <20260126-topic-talos_dt_warn-v1-1-c452afc647ad@oss.qualcomm.com>
 <tw2lcfppz6lrmnpcfm5yh5j6iln5amedo2fxbyapx5ralclhjl@tyiretqzszcm>
 <5227ff03-3008-48d4-a22b-f9a9b1d9bec4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5227ff03-3008-48d4-a22b-f9a9b1d9bec4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9B53WGvHg0cDWkhJha40-uNkY74bKojH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE1MiBTYWx0ZWRfX8/An6qLijuin
 9vQ68gOFTRr9tD6DIncRobaXDF0g4XlEbiLUD2iRftREsy6z9hG2Vx/NwsNnyGvmHzZ78n8DdRp
 NKp988YIbwsHojK4q9clhx3o8fJEMh0gS9bxZpC5HetDTxu5F3aOIEfW0qavr5nApq1UUgdpLMX
 K2YI7OkJQvU7jAAKDdXaQzeDpFtRLELotXeAfcpge20L+T2QJpYAmdtx+kTeLy4G/aLhzGIOxln
 v00B30QjuySxB+WSxDa29gXqvB3cXtrJc5hpg+AG7b6AnG7jXMMJJUG2psAr+6F7YlnP79kRYFC
 nTIbBWthl5Qy5xTGCa80/t0E0K80S9Mfzg+gP6cBOSfykFxAxmk1qQWIeXjW06qmYATzkhXZ77U
 BOPgAYvfCYb8yhLuOGQu1SFmf/EKXH/ufqw+oCbhFsxGn0FGanoOr/B0V+OA/JDvXIU8DwnXgFZ
 XcAQ48nIPNIUayaTqLw==
X-Authority-Analysis: v=2.4 cv=GvdPO01C c=1 sm=1 tr=0 ts=6977aa2c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QtkbibKGHj-dHbRwVhIA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 9B53WGvHg0cDWkhJha40-uNkY74bKojH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90609-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2038A8BD4C
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 02:46:20PM +0100, Konrad Dybcio wrote:
> On 1/26/26 2:33 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 26, 2026 at 10:45:03AM +0100, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The binding for this clock controller requires that clock-names are
> >> present. They're not really used by the kernel driver, but they're
> >> marked as required, so someone might have assumed it's done on purpose
> >> (where in reality we try to stay away from that since index-based
> >> references are faster, take up less space and are already widely used)
> >> and referenced it in drivers for another OS.
> >>
> >> Hence, do the least painful thing and add the missing entries.
> > 
> > One (me included) would assume that the presense of clock-names imples
> > that the clocks are fetched according to those names and become very
> > surprised if they are not. As such I'd suggest fixing the bindings instead.
> 
> The reason why I chose otherwise is in the commit message

Should we then change the driver to also start using clock-names?

> Let's try to review bindings better next time


-- 
With best wishes
Dmitry

