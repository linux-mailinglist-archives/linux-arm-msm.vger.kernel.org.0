Return-Path: <linux-arm-msm+bounces-89270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58614D287A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E27D1301C3DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863C2322527;
	Thu, 15 Jan 2026 20:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iA7aMjY3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="di9CFi13"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44471EACD
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768509814; cv=none; b=C9WJZw47TWw9Cw8FBzNrlG13B6ZR+8p2rSE0LKDyntG4qWfGp2nWUi5wm5ues0pP533QaflVxdhMUZdJYOjkFA+bU+/ro3R1u2xXiz0O+Vu5jWC/hvA5Pu/qBf4n/ZUAadaOR4dAc8q4OTdY0o89KKhbysDW7mIklvbu4thqJYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768509814; c=relaxed/simple;
	bh=qKOthL6Xt7ImFxCrLNlXwQDXQuMHZ0jksi+RSAksAHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R23m0Y+x4P/cE5ufPjJEKteaRx/tTD6dB2jZt/yD5tJpjpOxA3EoNk0x88o2K/7QN67jWg8I1RcUGYz7GcQNxT8eDyIhUM7oqi+jqK6WGKbe2Hd5w76fqNTY5kC7MQfx7T09CBXLbbbpAF0UPIRl8Pu2O3DYb+ZOKWCdTo18P2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iA7aMjY3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=di9CFi13; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY6x83202071
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ymt/FNPZnm6UNMpQELfRvR9w
	AD80N9Y40dRUzLFP0hs=; b=iA7aMjY3r6l9ZTZWldzvYZKqDksV8JUcmC7zD575
	d9TZjgzwBxJvPi4jjyd2Iabp9vTegm+w0YK+sUkSIhuHJX/zxHjoK2phqfywq+Y5
	MkwjfgHi0viyyovn6lAsvQMR0BPx47NTKutkz78eg5f+cxyfZ1V/AEqoyl0FUcQC
	RMnX8/qSth0w2qYrf7oRXcVOU+wZ/8xwYMqCN1vBTcbMcd9WKRV22oa/26iypw3/
	gGK8ryFz3RvVwui5mnqRV6qvHtG7AK/rKKocDLGAfcA6mSFVm8osx3kY+pVmgQB+
	NUIttHPzwCiL1ivukwot4mLhOu8u3aUYhN2AdqaZSnggIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxhs9ttp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:43:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a4c50fe5so213814285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768509812; x=1769114612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ymt/FNPZnm6UNMpQELfRvR9wAD80N9Y40dRUzLFP0hs=;
        b=di9CFi13ZAe95CmVIaRKHuh/ft7pzW/W3SS/Ju0QmeW5bjUsQ27WLxEmttaq+DT6PD
         4VcABosfn4hviHEkmYuJWKBxipDsRgrt7QBY+21kJK9SNgrCLh0GdA83czSC5L+CXF/B
         qQGTuURLo9L57c0L4k8A2qAu9fWjdlm7n7jSMtWiUL2nJkFTASu975WLmrPf4+K4D1Xy
         oxBbHzkqmWVU3TEEk6InZaslIGr/I1OQF3s7z6GLJeiLDmbDKNskUl7+M8qZyNCHCrXU
         mFWp4uRb5O7OzdXJE6kmZThBwJrtPEbfpoExxwI6UhqAA02PLuBB410BZCzCq1r03r87
         e03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768509812; x=1769114612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymt/FNPZnm6UNMpQELfRvR9wAD80N9Y40dRUzLFP0hs=;
        b=bEq9e+G0ibNy8Xs4b554ZaYPKaMqHYgW7jgRdi27yjfIZKpdVjyI2qTaSOPcVKXg00
         Dyyy2tmIalSY0QnAcJehV1d9eOJOlvUMog+70eJHTJgKFy6m4ksqc3j0D0BIqhXj2iD+
         USmDCpF7dySx6qi39VyUv96dTHauXWcfFu+rRF6d5N7S/AWL5cWHMM8BN0FiJt2Nm5aZ
         c+vwmXNJT5dTXnu5dDDpGG/+uzukfjVv74KEsyXyhvx3gpCoYJ+WiYW0SmYdBc6wY9rK
         DeykB02zSDY11VYH9VKW3Lhhox+5vA7PEtol6bXyi3yDLlHiU+FdMk7Epztug00eYk0K
         K3Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUH8pjZ6bDZ0xv469/35uvv1EnHn7yiKYX0e8WwQXLnKB7mxo799fMtEtXoQzPHlVV2mi/f1MN2RkuJQgia@vger.kernel.org
X-Gm-Message-State: AOJu0YwLm5QDsqHKPOXB5DQE46SwudlEMbigodmeaWGu9ZcZwbSRlT3X
	hIH1KVXGSX6t0v+ATR2BHyd7cCfZa0OLGegMlRLSycoxEPMGzb8MNWALxtL2exzmHQVKETzEsrW
	tcv+/RuFanrrzInoT/XNtvHrzNCKHl2J6DL/o8xR173jlI/FlmvbT48d6m2CwzZ8MKofx
X-Gm-Gg: AY/fxX40XrwrkQ0jhAUtVTs02vxXlgTBrEXymW6gyThaOdnr85NYM1nvnIZfprRH/5k
	GGsGpWSdoRTcTLSz6ZmxW+f+tlXJjWuJtNm7f6wdYh77gFm++Dm0eNk2P9VxhSXFlsbIndngff/
	FqGNBYScZHvaC24Ad6wwVjj0+Ad3x1K0m2YOWnlDd2T1HW7Y2JE2z4q6mvQRW2ljNDkyRr2vVHB
	79Xmnn20C6/yHx1kvjcHtRYOCE0Bsc7havx86LgdlkFx5B4LRqTh+x/R0n3P9P0L/Od2g8C+Yh8
	z1j5coHseagCvv/whx9eD7nQuY+DqmZIzd/+vwjB7qEi8m+6aRRlun0VeI5YHK8nx6Wdmsu3Qpv
	2CZaGcNVVfzscy53LViioEKJ2lUXlV6r/bjjDvafu1we+/kaPcb6tAtiCkSYQpz1/EmVCVuua5Z
	jEUkZlO6SyCvRonJzxbfPdGLc=
X-Received: by 2002:a05:620a:2802:b0:891:a6b0:7cda with SMTP id af79cd13be357-8c6a69631a9mr103535785a.81.1768509811682;
        Thu, 15 Jan 2026 12:43:31 -0800 (PST)
X-Received: by 2002:a05:620a:2802:b0:891:a6b0:7cda with SMTP id af79cd13be357-8c6a69631a9mr103531685a.81.1768509811206;
        Thu, 15 Jan 2026 12:43:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384f85c18sm1440881fa.38.2026.01.15.12.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:43:29 -0800 (PST)
Date: Thu, 15 Jan 2026 22:43:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
Message-ID: <6usjefc55acdchitwe3usqtkr6ca4rtaen3at5knwygakdkze7@caqxdadvnz44>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082851.570-2-jianping.li@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FI4WBuos c=1 sm=1 tr=0 ts=69695174 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=EmNSPOy90j3J4AqDr3YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hW81zxqYxIJs2bzyXLija_9cXgpmX6as
X-Proofpoint-ORIG-GUID: hW81zxqYxIJs2bzyXLija_9cXgpmX6as
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2MiBTYWx0ZWRfXzgPbfcSJCrC5
 bRewuGJmm53fNRmuJivwHfWruHQH3PUtbu3Qh4Ubxlc06n58x/qwj8H9o9dSRYnlx0Fm8BbMnzY
 6gOFsC5gNe9WLuLyA/3WLE6SfsCVY2YHL6hl13FFteCD/SwpMyAGmm7CbOrko+1XJv63AKwj7Bv
 PL8/aLjGmQ0V+RRB+IU1rPVoeKnXTHTYiPgD9CDGp3JndqW10RmNSOqqGVYmQochn8+g6mAT/7D
 pGI0BUpFmT72I7VmchufgFTX+7KjCV9t3GF4A00jNZvByELpykhkqnJ5OYQ1iXkMosOO4hYe0Ad
 YEyCGx3ttxFILNAwo//IrTja8P8teHB8wGG25LO8SefjDj48NAZR51md054DVR31pqCASUhAkfV
 BGffZRavVZNS//jXsol8tDbFHr694F/ph1WfT/XKxiSOgwfXPYTVCT3EAM3uuEPyK7hSLf2fZAB
 OuRNeIouYe04oGlg4Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150162

On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> The fastrpc_buf_free function currently does not handle the case where
> the input buffer pointer (buf) is NULL. This can lead to a null pointer
> dereference, causing a crash or undefined behavior when the function
> attempts to access members of the buf structure. Add a NULL check to
> ensure safe handling of NULL pointers and prevent potential crashes.

When does it happen? Do you have a backtrace or is it a safety coding?
Do you pass NULL buffer pointers to the function?

> 
> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

-- 
With best wishes
Dmitry

