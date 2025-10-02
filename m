Return-Path: <linux-arm-msm+bounces-75772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF9EBB2780
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 06:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AF7D3B1AD4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 04:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC7C2DC767;
	Thu,  2 Oct 2025 04:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmS+2Auk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1DB2DC337
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 04:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759377833; cv=none; b=P8UZj6eDrVAtk/R0Nh1aA1652BVHYbJvf4iNxgOfvwvGR9t0arIrDY61ZWP0U87P4e4oWm27h8CCHf0XUww2dlzlFTxi9xNwDLYEqQz6W6aHS4ADAJL4sWIBut6JiY+RtsZzSMayR89xKyN0tS9eKM2z5R/wnV3mPUWujfk2EIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759377833; c=relaxed/simple;
	bh=+kpouLBH3+i3L9bCw5lRcIZ8dux1NxH241oSpMjEftw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfceW+Z1SJUT/4YfcSnUjWC9TXc+517D5mwJwSWuvFCLISCboMrQGZhgeWWLb77QbtNdL5b0Wy1YuW4Tx+3bgVEQC6CVrTAzV/miEd4jAzy0xVu4c8QlnTn4cyHHPf6hN/bgnrlcWtXWTacQD3F+bQr2vGgB1qb9fNAosAMKVE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmS+2Auk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbvwO032054
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 04:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vDEXMrZyI5DjkHRHF3nr0kxs
	P51hoP/2gaSxVHUCc9Q=; b=nmS+2AukrkY+m+RurA3EtNGV2FGFou88PLYeG8bd
	AfyL6ZpDTBu/diSPVJvZE1BEXGNnGJLOvtpsZv8GZ8pTFDnpUINPxRmOwfFyJrXn
	3Ek6K7RqFgWZNLxs/DHyicv0O2B3IuTMkBxc06bHGKgLFwCnXv2d/8J4lkvSbFW3
	IrqpgfXHmYvAX0s6i1a9jnWHDR2EwTL8q3mEzsm02SM2l0NIapiXMOsW00tUusmm
	QfljbzctBgRPieRVRT1+p35OaphTZD95sfOvkyWzk6KuicYA6LYNi1/XiF9Qn+KT
	mA76i/QDwh2Pv588pcYn58+SyMTz38C+51aOBgGG8eVcHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5xrpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 04:03:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e0fcbf8eb0so16465431cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 21:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759377830; x=1759982630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDEXMrZyI5DjkHRHF3nr0kxsP51hoP/2gaSxVHUCc9Q=;
        b=SCddRnmZToP9I9eXwaxu3Z1e6viSpt4pz2ah+uOyI3S/8N5Sk6AAp1eFpV8Eoko6LH
         PvP5jQeZOw4NoKyPnJ6dLS0QA0e0Fgz6WtjCcCvHk9eFi08lCYpKlRSCoGckPiUW5Q+w
         8kSypXdXyIYndaZbCVkr78K1YiDu1/FmZ0Qo8qD+9Bk+hYTLdDlKbB/T/kRDXCrPkQY2
         fhi7xvdYTvEaHDyUrS+qyAGzBiSeQGDRtrfAHPdA/w+7mC5aQLrsP6fL6ZAsTApeOTG/
         kzii2B7Jnn51GNsbqo19AjkHrEkzj+nzmpdfwYCFWw+lvqXkTfrWxrTDKsINi318nQKS
         GhnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5dPGaIJQMSDzsJqf3SmPBmNiUqewkjq9RRQBud5rZluPtjayGc1ZulhYZI0cGNUsSTzZJhp9avq1yqUCm@vger.kernel.org
X-Gm-Message-State: AOJu0YxHr1HK6Slj3er+/O2BKBgTtwMlaklc6/8oatbyd3CMKitAkMZR
	qK1oSsgSfZ+/kDauBc1Phaul9PmVRMfdkTumTEpPSlRG2xlZ/c76915Bjiw8aWhUvCJfnzsBRKT
	fzMnZLLRFpoiv+LtCgcowGqBN4fzkG6YqU8UbwYKxH9U8CSDJwnVa4llk2QZ6eCPQJGoQ
X-Gm-Gg: ASbGnctu8QWMyZjUxpeqBNznBhz1FdsUZRPmmvMXXky49jw0fMBjGbgIP44SHUCQqhC
	qddffqLEPi+J+53zEB+WWn8ZPCIuh9zsLbjQUNLAUQKaH6pa3mOePSNBARS35SaupIkFyH+qV5f
	fB3hhOq+8meHhw5BjIkNmEyUINsFUNemjWU8nM+Fj3WZaTu64vx/bzEe27s1e+GsJdf67P6ZEjT
	OEa+6pg2aSLgLduY2rgI+z8PRcea275LWvbn/Riuor1udF21dVrR1cbS/APp7aiaMADNFAgVCw4
	8dBkoG0QVUvq5exABrb6QCeCgEpgrQ9Tlxv9Z8bMEWDTgfhO9q8X18JSb0jCNV2N156Wg7pjTsj
	9tykysu5CJAzQ/mblrRQafBiPd+pj9HzvUBWPqs+JWevMD6+F1XW3sWF8sw==
X-Received: by 2002:ac8:5fd1:0:b0:4bd:3e4b:ba5e with SMTP id d75a77b69052e-4e41dc7e96cmr73704491cf.48.1759377829789;
        Wed, 01 Oct 2025 21:03:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdRnA3NDBk05T82OdZV3hs33TJ4DX6PASBWRlUSILv290R6xNtY8dpoH23pG+GAI9V2WH+nw==
X-Received: by 2002:ac8:5fd1:0:b0:4bd:3e4b:ba5e with SMTP id d75a77b69052e-4e41dc7e96cmr73704141cf.48.1759377829292;
        Wed, 01 Oct 2025 21:03:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d3dbsm441304e87.65.2025.10.01.21.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 21:03:48 -0700 (PDT)
Date: Thu, 2 Oct 2025 07:03:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Use correct
 compatible for audiocc
Message-ID: <r2spjuu6yaz25ujrr6q5xli6dwjh4fh7vhx52ldsprbibxgcji@rhbhwupqhciw>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-3-5a45923ef705@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-sc7280-dts-misc-v1-3-5a45923ef705@fairphone.com>
X-Proofpoint-GUID: jDPx05iiNnb7OQfPd8adMHDYHxHVUqsR
X-Proofpoint-ORIG-GUID: jDPx05iiNnb7OQfPd8adMHDYHxHVUqsR
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68ddf9a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=ZWl6vx9Q9smWLlo6MzwA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXzPEICxq5d2Gg
 r5+xrBn7zvjD4MwYMh/JYrUREBgLCYbfZMgfSkbZCHi+a3KWOcOEX9dxmWyKRtTQ9lM1uu7XNC0
 2JiiNeBa3UfMsgFDiLLWYiq29eDEKw2DbqNYgUJ12neLatfiP+mqo2ksj6t7ELK51wmLtvMLTIi
 d/ELYJCxjrDB7cJSHKMSJwxfHE/XzsJynsQzmoKGXHiidvtYwiWniQONNW6xKCnL0V92HAbLA1i
 HU6Bhc538dvDlpPno5Hg4diUXXg7v3pSFbrEi7olhr11bAIIOwd7XhjOgwHR/Kwwn6hzzAOZWWc
 EfjTX9J8debSajhVdo5R32jNsNf+n/PQP83y7ZhT7EFDkJElp+SVB9nZD1Rzwt0XdYU+O5DruJD
 2DMWuGanDpiKyfXFVLZOfa38fOvszg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Tue, Sep 30, 2025 at 03:57:03PM +0200, Luca Weiss wrote:
> Use the correct compatible for this phone with standard Qualcomm
> firmware and remove references to power-domains from a 'reserved' node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

