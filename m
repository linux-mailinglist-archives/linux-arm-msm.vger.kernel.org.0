Return-Path: <linux-arm-msm+bounces-52550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE93A71D76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8E5216ECE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 17:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3D723ED68;
	Wed, 26 Mar 2025 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fexh2oru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2898823E323
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010910; cv=none; b=S812GRo2tr+5TtesVKAoO+ipxq4Hb9jA9UAudtmPoUGllP6iZ8dPT+BnFfQnmEf091LTvjbrwIbFuKbcgReZyfUVPGYTepawygTLsnWrpJ8JqeX2JYcDeNKdpb+DFe3HYkzYSPaNcCTXeU/gtYBDyLrcdX8oY64YRqbtCiiBPRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010910; c=relaxed/simple;
	bh=VbMAnTpopdjLkmZXesRjVC8mZ8m6kPoSqNU934M0L50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+xWRN8K7Rw3dHQ928xWm8xvAUbUUK5OZtQ+wAj6LAiSf7eZt6QxSiYRo+E7FupEXWIZd/FO99YppTyfvRdWlkboKboevF2V62yCrCYlOPkPkIgjyDvN3FioTZUYQ7d4NWuvxH1VEWDn1dSpnQtG7abF1ADqyTSMBCT6d5KQ/Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fexh2oru; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFKUoU014507
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AtUnXSz/pPSjd1StFFw///pe
	5D57Ql36lWJoHWVv3Fg=; b=Fexh2oruYqA7AuiHnh2DEl9WXCEYdshYebDWjZlc
	JGNFGWH5RHBhLhbjlQw/2B9zVe90qF3/7SCwNH67i4/Pr0glrp8WrUils6l08CMq
	5RouYJWoF6vaRSWO2odAH2W7iPx0PxJEv4sOPcl/psulIyAU6+o1Jp1yjapiPr1L
	KwkhCvR+ykjSReuDroCi5U5OmaemfZgZScRN01peHqUTVvGS5iBelFE5gOkQRzc9
	khDybEE2Ju7HQykeZVdshjfPwV3XkJjcemmh11uDcgQ2me7XnO7OeO2QgM7svRT0
	uCxlWmmwFe2GER1K0LgQBdPGeilrUGE0/eYqiMO5dUq5bA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9mt3s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:41:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7bb849aa5fbso26280085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 10:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743010907; x=1743615707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtUnXSz/pPSjd1StFFw///pe5D57Ql36lWJoHWVv3Fg=;
        b=B2YxtxuJ0ayTXncFbiCgliYyh9u3DoFVJuBnvfgQYVbiJaRPn1YpS8kcZ3VUPyR9VO
         A0kRlt0Ka8oqS+1KTJktXsjbNaAkl7zAHo5KmaxxbfWimdFF4seOBXWrv8bU9XHWLNno
         4NEDw6nIyig22FspUaSO96aGxVYIDvmLB7B81tOXeB8LEfm/0gW7X+2oxB0W6q4MPg1q
         eAsllSctswHI1YdG0BYSzhnVxlk12rPgg4JZac6rTPCreECdka6QY7i3EAwWUUeCnmbM
         7oCEBA5mpztIS0Ai/eXL9GkQeNnDsthWDH1u4eQxi4HTx9aLHSUT8NA51pcQj1n9Ukie
         WqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGUz2Q7PIjFVoOGR4bOVLJZfkToqF9QGIPYBHPBV/rhpjxoxDkWFTaCMD/SZi8rieDFOd6A8CG3j5rX1u9@vger.kernel.org
X-Gm-Message-State: AOJu0YxBPSxHWYi2N2XXBxJOlhogkpc3Zy4h0pBdMiNflW8bG5tGYZy7
	+av4XAefZrbe4TpOTUBvT9HhHnEq7ehI2K7EsUa/kj+tY97ksiUkIy2S5tK4i33/9WW47UAKcxX
	1Lb6WOFl+i8U6KjNFVSXBjnqlq6eVP2Qqo08wnsc+I2RxoTPUFp3CZYogNBNpYxBw
X-Gm-Gg: ASbGncti/rqRzgqY0yHgWQ5X4zBGTnhSMSv0nisG9MaMDo/9fizypAXWvdNx60/wnrY
	TbDPh9vyhCNKznVc+U5gpDnOyykFx64WRL+TjazIDblA9TJT1xL8nUxOhKVxx5opRU7gOX0syEV
	w+YAhkZViGq3y4xAkCn7kdpkRDZCWUJtZ8pX2+EuE0SKZAaPwO/mGk62VeEWePXVkEkUCdBYxUi
	eoXX5BnivrqpVmICYsDi9M/5XsbKpHTTxqrmC3B9AALKUWNmwHZpXzMeY1wbsnXl8knQo/b0odu
	iP+s2N3ooCsPkueWNa9NQIGfFw6ka0ZAIGnl+D0/AW0Xcc246/d5N/jypgyqCIk5NshWSJsmNKP
	kBO8=
X-Received: by 2002:a05:620a:17a9:b0:7c3:c111:8c3d with SMTP id af79cd13be357-7c5eda91760mr82460485a.49.1743010906948;
        Wed, 26 Mar 2025 10:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuqcfnhkzb0FRV+B6Fzo8Va+R5lmfJZjN21TrvUtVriwmR9+t0F3bAporcIBSfQDBEa+GQUw==
X-Received: by 2002:a05:620a:17a9:b0:7c3:c111:8c3d with SMTP id af79cd13be357-7c5eda91760mr82455185a.49.1743010906411;
        Wed, 26 Mar 2025 10:41:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7e0ebbsm22090901fa.34.2025.03.26.10.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 10:41:45 -0700 (PDT)
Date: Wed, 26 Mar 2025 19:41:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 5/7] interconnect: qcom: sa8775p: Add dynamic icc
 node id support
Message-ID: <bpjjnvw4mkjieidi7ooukt7f3bgxig5ezyuhp4tjmufr77eoel@bwj75fjd3mxs>
References: <20250324183203.30127-1-quic_rlaggysh@quicinc.com>
 <20250324183203.30127-6-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324183203.30127-6-quic_rlaggysh@quicinc.com>
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e43c5b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oKCiNua1F0BOgjzGbBIA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9_AIAfzXTdqAi5ypwoPWdSRxeh9et6q3
X-Proofpoint-ORIG-GUID: 9_AIAfzXTdqAi5ypwoPWdSRxeh9et6q3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=814 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260108

On Mon, Mar 24, 2025 at 06:32:01PM +0000, Raviteja Laggyshetty wrote:
> To facilitate dynamic id allocation, discard the static IDs
> from node data and set alloc_dyn_id in descriptor structure
> to indicate dynamic ID allocation. Update the topology to use
> node pointers for links instead of static IDs and forward declare
> the node pointer to avoid undefined references.
> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---
>  drivers/interconnect/qcom/sa8775p.c | 952 ++++++++++------------------
>  1 file changed, 347 insertions(+), 605 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

