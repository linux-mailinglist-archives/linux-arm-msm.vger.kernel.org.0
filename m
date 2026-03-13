Return-Path: <linux-arm-msm+bounces-97297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGnmNjiAs2k7XQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:10:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A5B27D01E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4AE13010BBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299EC3054EC;
	Fri, 13 Mar 2026 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDoeHOSC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQu9sfT9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01301CF8B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773371401; cv=none; b=sb0pGh9sEcGVHAt3KnTl5qrhv+wIF0LKY9/wEeXBl9sMTNP6YjLOFaLkqc0cOqsFBj3nnUZ7DhVNcYxNvZHbM4kaxNrT0oBF76vpbFBbz4rZpnpxh7nJ3WZN4Z2hIrt9N3C5AXqpUSJt3qE5I97k7LUw6qPMCTKUNnSGRlXKP38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773371401; c=relaxed/simple;
	bh=CPIszeQoPl4cyX2RB3EaX6LemLP4IlmTGeesBPewxTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nw27bRyBY37rqJZS9YI+s7i5OykR0USoG757+oSxPQPz02mYpRyabim5IJNftFJeP95kwKPc96jESkcIJYPHLcu47QH4HTQms5r16PEA+TTGV5Uex6pjww97bwOoLmuX2xjLbWF1CWC4ZGOrkEjXTwAcCi7fZYX/jUdRA6U6RR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDoeHOSC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQu9sfT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CKnlZf1756415
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VdSteATUAV74Nbc/dBNQ26Ud
	tGUTxM8bh3mwYCT8VxI=; b=MDoeHOSCLqoPxZ/X0CK/Sat8480PzDyEvVhwcT6y
	qXQMpGoDF5xTBGz24k7LLn50ptlS2yhJnY1aToO0gE7MVtiOfHtiGriwbg3rMnkq
	+al3e20TDqCmQEPOtfv3LI/IncqFLHlQjfdvzjC3/HT7yAwJERaYgYrT9Vix0kNv
	q8YEd4hAYxtQoGnARciZuODbR1L23NRW9kRfmiIyACneVB0cxEy11kVKLayWZ0mF
	Xb8RGsGo7wQbT9jOdPLfdone3DuZFujMj9NZKpb5CH1XYF8Cg0yBTSNGMaiXZr/Y
	5GxMP1AZcibJvsWG9aoL9Hbw56/cVnf3UYOqpGiXUWVJlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53m8qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:09:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd767c51efso222623685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 20:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773371398; x=1773976198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VdSteATUAV74Nbc/dBNQ26UdtGUTxM8bh3mwYCT8VxI=;
        b=VQu9sfT91xNFSEBnLeM0WDcIAV+ULUuUbE8ZqOggLq+ZKmmdkCnzlq8lwGXFLcdzre
         xPOV7PjsTRZwSp0Nq0L9J3yytqjIQ2sYmYKsAdttFeV8F+NrXUWzcG0Q43WqkwKU6RSr
         kWCyKfz/DNSwh2ffk/76jcp9p9fCFtE5CNW+GbNWseO6XHQK8P8IulYsetUxWr71i6HF
         simKaJpCnIU7ZjPPJ5iBEskzpr8/6pO3yCIHB4kw+TcV8aVb88ZWZk5x6CE4IUmLBnNe
         VYsNJi6prDE+Sqc9LOAXD8Tr3Cz67rCwtB+N1LqK40UWeIEFBmQYQgzXEvFGf5niY6K5
         fMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773371398; x=1773976198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdSteATUAV74Nbc/dBNQ26UdtGUTxM8bh3mwYCT8VxI=;
        b=Xr/wdZ9cRTEPctd33Zy/EWCzdKH4p0l8L7bkVc+tNFPiocPx5RZBHMKnGGqH6K9DZr
         s7PjT1UCgxvNHW4THap7lsv/LPocYpBPJoa0ptoFV4YyJdF+C1GeKsVV05T33BP+MKkU
         2bKxz9/O+H7dEYLt0DnHB5DKBePNscNdkAYoOlfBnYbX7i1g3/Hj+NYWQb/ZVz+AvXkO
         BrPiElcVGAcDWb56pzaAn1pyR5K5UJEYCEevqas/huZPKkIzYoI8J5H6+iLkF6L1iMZv
         7kOm4F60sOVkIiaD408b9gy+GHEwZnErBtYpQ7G7VjdQWG475JaYKYmwCjJG6fznut0F
         0mXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpOuCd9hx2ci3eVekgrqsa0uRpDSKHVqkmZ6bo9OMnUO2XHywuQnBVMmEffZfh7xU6spzUcNfBWXTEaqjo@vger.kernel.org
X-Gm-Message-State: AOJu0YzhsaBj1S3OqkruRPsvGEbL8Zfc3dHplHnEDzS5iahsufErxNrP
	TFSAKG1GVDf4L7OazpCdSf55vFGelIBaCiM1CeUQWeDqrcsG/Q1Tbj+4DuKEp5E2fEei25rccZ7
	ycfbjK8fRUIMDHYapB2sqUzoocrUXEaphUwMntkqjUUMGuUF85a4taxT+N1FvULxo2a5L
X-Gm-Gg: ATEYQzzjkZrHEmRbpeiO+kA9Jf8xQWX7BEhrMHQpUys/QmLl9qOfV2YVakxunE/T/jL
	tj3QqlgWPlsEW7mA25On9W1nmqo/KpSsofynW8Z2yCSdSpQv1P0VFsUAnpjgRxF3AZTxHyrsilp
	f/NjwKkq1Gy3bF674BVOyowc/hEHcFz4/BQYOocRUItu2mfVTf1vV4A5rcU1/QqLK6x+XVnmKjh
	KyYi2X35VfiW4jgk9K8fb6IvD25K/FSzOBjIKnCIGdidOkAQ/MFQgyoFZPwqFfi1I3ja4uP1UQO
	ugLAEsvr4YqT6AQZiPaXp3otOszw2DbNLxsLcnteO21flSfNtlyIEgIi7M81HNo7Wy5b4SWyR8l
	A7UhuRRDROXu9NBIcrsNzBeEjwzp/K+Gyp5P3rf4D4iR2SDv4q0IorlZHClJu/rHKRTrK3ynoEP
	fE7k5ZUMAFgCSgLHuSSYxwox5vfVcoWv70pco=
X-Received: by 2002:a05:620a:4095:b0:8cd:ae40:acce with SMTP id af79cd13be357-8cdb5ba32damr255979785a.78.1773371398178;
        Thu, 12 Mar 2026 20:09:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4095:b0:8cd:ae40:acce with SMTP id af79cd13be357-8cdb5ba32damr255976885a.78.1773371397697;
        Thu, 12 Mar 2026 20:09:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c8bsm1351572e87.3.2026.03.12.20.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:09:56 -0700 (PDT)
Date: Fri, 13 Mar 2026 05:09:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: disable WCN6750 and WPSS
Message-ID: <mlxt6jcozsnavef2dn2gifw6m52s7fudipyf7ie2akdceatv7h@zu3kls5lcwuf>
References: <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
 <20260311070408.2287889-1-hangtian.zhu@oss.qualcomm.com>
 <dco5knujhpt6rm6e2osfxsuqr4uqjz6tugkhvi7cnx5wbbpmum@ejjfx3d7onoc>
 <c4a885bb-6526-4f08-9187-bd6f1a10fb71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4a885bb-6526-4f08-9187-bd6f1a10fb71@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b38007 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xgGPqZSNmjvKYrcD3c0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyMyBTYWx0ZWRfXxMEc5osZFjut
 u46Rnpe0tGxTiZsfMR4W2HzIrIT5OsrsMXCcDqDjyujh5x4lfdH0hOgD0LSxCewfzxtxxZ62CRi
 3VuZGHBLxAeZJJbvXbdsHw0jZnF6tYSJU73UVfaucqWi+Vs+PSLxLyH6woY6vD/+sDipjG2Xqxi
 /viHgL4p62wAIASNvDx9XKJvJ0qdQYK04ijBKelyqe4/YJw5aGFzileG6P6KRAs5RHprR3Zhi0t
 n5G+6RhVn+ecZq9JVfJTF3mWX4NTZHJBe6KWRQ9hDXizfL8x1BmMIaqqueu68xy/h9/6odyVarR
 GDA2Z86f8nvkvQAO3BCsmPqJdmSl3xV82j3+lzXyVdNsWxx16DKDCVwg+Ra2tsmdfZrwuoKPboN
 RTR9//KC/acptRnT8OrB6laN4t39iEtwF6Kwvwt9EQ9sYJq327TmxZs4YiBWmCuR5hBwtcs/isA
 RkOEPNXB0sPcHVWraIQ==
X-Proofpoint-GUID: efeS3VUUZB017ocmq0gokff0CCQw6C46
X-Proofpoint-ORIG-GUID: efeS3VUUZB017ocmq0gokff0CCQw6C46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130023
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97297-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41A5B27D01E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 04:20:10PM +0800, Hangtian Zhu wrote:
> 
> 
> On 3/12/2026 11:07, Dmitry Baryshkov wrote:
> > On Wed, Mar 11, 2026 at 03:04:08PM +0800, Hangtian Zhu wrote:
> >> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
> >>
> >> Disable WCN6750 and WPSS on industrial mezzanine. On RB3 Gen2 industrial
> >> mezzanine platform, PCIe0 lines are moved from WCN6750 to TC9563 pcie
> >> bridge. Hence disable WPSS and WCN6750 nodes for industrial mezzanine
> >> platform.
> >>
> >> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
> >> ---
> >> This patch depends on:
> >> [PATCH v4 2/2] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1
> >> https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com/
> > 
> > If it is a fix for the patch which is still in flight, then stop posting
> > it as a separate patch. PLease work with the original series author to
> > get it squashed into the posted patch.
> The base changes are merged internally in QLI 2.0 already, it can't take additional changes. The base changes are PCIe specific, and this change is WLAN related.

What does QLI have to do with the upstream patches?

-- 
With best wishes
Dmitry

