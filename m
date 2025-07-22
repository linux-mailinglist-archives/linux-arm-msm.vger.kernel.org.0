Return-Path: <linux-arm-msm+bounces-66062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15D6B0D911
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C6B256133F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38A12E8E0B;
	Tue, 22 Jul 2025 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkTa0ng6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB6F2E8E05
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186333; cv=none; b=CeoiOQSDuJtQhUQ9B4IogJwkgaCo9rd0PVNv/cohjN0E6FNv4mhu400CXEKfcZPNiT8in7KthEFMTaV0nuFwTTEaKlVAh/LZ/Np8iGr5g7mQHIAnpRBOiPs8fu5omyjQQBCQ32sYLnSZylkW7AJtQPwtabjbSbJgDiGhwifjeKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186333; c=relaxed/simple;
	bh=9AGfNi8Z3abxmCMBqD1ZTBLDwhONqppJromaTxecKAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2z3tbnQxGdCuMysuIo2KVLawi94MjQMBuq1HXl3JRbwNZQtGrCfo7BfyPW5CLSxedwt7jLeH221k9+FprqcOKdDrZ+sjwpI+7m3cyzO/F6fXawMByEBygeR5g+gePrpop2s5J/37kYEt8nXYZCH0FaFeQadTiNIzDnmmfbMLmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkTa0ng6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7Tbrr019401
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NEHXuEGLvj8JYaMRceqywm7l
	bVVNFFO7FenpbK/Ukj8=; b=hkTa0ng62W9KTnRIW60j4zwvEN47S/Ij8eczohm2
	NeQ1eJ6VSSXcoRihBgFZmWtHSnKeQRkqCPvpz/S3UO65U393ytMiBs/oE1kCa1QK
	TrVETZTDKNF/nr2quSYhqrINE5oBAvJ8yHGAAt8rHjXvJgYBvq1RpWs+7dv6tH8T
	SH1u5FYTw5RxADVc7mdWdY0G2Bpb6HUDihhIkbKNBk+U8oLeNP8p0euRcdhSxNqs
	BeMPBgzM+QcziBkwdBmG7O21xC00c6C7Gw2S/CCb87Mtlvc6/6cWoFUhxdgopz7i
	RkFcOaPUdMWQ3pnwqXQ2M+apw1c4lO+y0GqVSN8NZ9On2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9yqmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:12:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e333fae758so1144789885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186330; x=1753791130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEHXuEGLvj8JYaMRceqywm7lbVVNFFO7FenpbK/Ukj8=;
        b=f101ex9bxwEut+hb4XyHpGbZIJ9mby0oJUV3U2zlYBxtzBGU+mvQ71mpAarH8e5umt
         StXHPajljbAESrOrphg2luao8lS/M7QzPMkKru3nOEZguE4gCrGPvpOg/GMPoxOsJbMg
         MEY5Ba0ZyqgkZrd4VyAvBBavQdA4q0TtbKPYAp0WFBy6IeBsGPX19dQVZxB1uXgaV//y
         4LoWacqPVOnqAG+Tak9F22T4om5wK9zrjotA88GK4DJkzl5l3KFULe6DXGbdvgy6wNoB
         9mGKSTN5wgRGcdE1cOK168HE20ru34npXkWlQ/BuG+qiPU7yxoeik27dfNXbvLn+jLWn
         Sa1w==
X-Forwarded-Encrypted: i=1; AJvYcCXCKPJ9LPJvjmTSFFkRsZrCpSJM/UZLL0YdPB/Q/JuyJ16k5bxs7Rz7nGWpP73VDPxOkZ2/YGxCKMEmwcuQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyG1HkYw76++NzW3JKn79eUmmKiXo8/yHhVZ4p+lnm/FsMwOyZi
	J5BS5NnZBGw9czVNzU4sPVA2PVTVMs+merTle6Mv9vf3/5QnXeU9kZn6r6roBEmktmnStpDKPcd
	eqqUBSMtmYSk5UzgHDM9XZd9ZHT1AS9Rbivi9rpqM4AhKVDgVN2M4seUNcDbcTY3sRpJV
X-Gm-Gg: ASbGncsvcrB8dPgESJwA3ucZcKK3fjQRtQqytWTVfRb+vpsa21alNlnjzkpEPWmCM/2
	WLNPEtOyMxCs8OJR/5dh+Na9f3xFHMVw6rPabLi74x75lCRh0VeZti3T007oILae0/1BdyGGsUE
	2zlsXvnGpt+6XgWnRfGWmGMjDqEZ4MuDvdTqTd0aVJizcPKqSB59kjObivsdHif9wb3NeCKA7Xk
	TGXgrLXh9gwDi/yz10AnldetO0u77ROeUpkSaoWq5IPRH4DOwPre88DQypTU68bbD/AS1KJbhTg
	qFUxd3OZz02YOCVuksSdqPhVbPYBVgDcS95ulkt41VrZFWaH5vYIc/ZMJHMOnP9D59uxYRV600R
	I9kDpCM/AZSngGaC5ApSYxhvMY0ypgF2LXAvwfiefDkp+mea4ftxs
X-Received: by 2002:a05:620a:2681:b0:7e3:16b7:bf26 with SMTP id af79cd13be357-7e34334b831mr3210688985a.4.1753186329668;
        Tue, 22 Jul 2025 05:12:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGJb2jv2fOXgaW5Cyx19ZEkc07TsYWKVZzz0wEH2xiSqbTtW2kvxt9F0BnrHo0cf4Ck6Rp6A==
X-Received: by 2002:a05:620a:2681:b0:7e3:16b7:bf26 with SMTP id af79cd13be357-7e34334b831mr3210683885a.4.1753186329106;
        Tue, 22 Jul 2025 05:12:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31da2eedsm1933882e87.187.2025.07.22.05.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:12:08 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:12:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: add PRNG node
Message-ID: <omokqkvpqalzwbc67iblekuiyfg6tnob7hpjh6ka62mbsaltla@7ifwjugxpnl5>
References: <20250721-ipq5018-prng-v1-1-474310e0575d@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-ipq5018-prng-v1-1-474310e0575d@outlook.com>
X-Proofpoint-GUID: zxl0xBjiGwxMl7NtCylHG5d8rxhI5oBo
X-Proofpoint-ORIG-GUID: zxl0xBjiGwxMl7NtCylHG5d8rxhI5oBo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5OSBTYWx0ZWRfX2U2is/oJNtu4
 a06bM5DD8XAfSUUVQ0R3i/Q6fuRZFczy1YCPr8ga08JHWPpml1NrDk7Hz1VRRDNaOPN9potensc
 EWRcmvBs3tdxVLrSsaHDu9XxoOoPwjZdMoyWS/dnCYzspKSsNg/eyrjDmkrvl7oMIwlzkM4TcsV
 zBl9lnlsmDd/iZSDz3Z/sU/gIDSyHkmg27VkSGCAruRhaEAaQwNKMMLtfl/AkiewgfNPDJONoZL
 XA/JFEyagEtufu1XmDfhp2Ww9/YbobCVkbjlvjg6q0LKKkY05UJ2n/bmy2tQKTszotsilGMpIsF
 1zqvoYyu+0qRn2ulUsWcNKhQEPprqcvPL4Qcs/F0BY5ntVsSt7lwSo89wCr7ZvyuuXb5J7NW6Be
 xwbCqQsN5Pm40pe06gZR4mSTv4l4JuvstleV3g92AmRxjxB0eAU7gME5zHXr8w+0eVIEKs3Q
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687f801b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=OhTC08-JUxoFBRQK_kkA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=689
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220099

On Mon, Jul 21, 2025 at 10:30:46AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> PRNG inside of IPQ5018 is already supported, so let's add the node for it.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

