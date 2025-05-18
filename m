Return-Path: <linux-arm-msm+bounces-58354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0200ABB24E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 00:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CD32189155A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 22:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFA720E6E4;
	Sun, 18 May 2025 22:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJn6Ry9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4FA20CCE4
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747608610; cv=none; b=RDHoMMhIVo4IWSgQzTXCIUtjS5gQwg+iCC8WtnEBICuZsC/9ZGvzzI7P3yHPw79LtOrlqSb3sK9Asf6j2dIleulnrvjNY1MSPWgfJlMxw40E0yFMWSL/kAnoHkmvtpQ9wK4c4cRIDIM5leubLd5HgWY07jayYjldkjP2b/LOAW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747608610; c=relaxed/simple;
	bh=Ex86I0ZvxrbfqTp2fbLghS1UXpowyli31R29CSu4lUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMfA1o+MWrzLWNxeI3bWuIdM5TdWikxh4kw+4XUrEMYebT0/dccoWsX+x+z7oXXedFTTPXSg/hYikn0ssvMR3xmH42v0csJwHGBMMoP+qRLaE/Hk7GWyHhuYeFNkFjSe2g+Reg9xOxLTU9OupvDxX2LQOk3M3pLCJuVvZIKZUuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJn6Ry9e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILk3to025295
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 22:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=InqaD2zz8IXPbJ4Cc2UGd8YB
	VpLuDNI5sRhUYI1lQ5o=; b=MJn6Ry9eXF4v1O8S5WC/ZKbfJf/AFj3eZKRLF1ka
	nKsg/wkVc7SBYhuU+fi/z6NjhDtXtmy/NpfzUDno378HW0FtDq1b3Z37/jX3goQL
	y+UUedCia3w4J64l7azu96t6ZDE3ONxkoipDIR3VrqlOppjUCedtlT+DWFxjBHXq
	d1bSRNfxQB56a1PhjChq9NbGS/+p0A0cpTXIG1gS21/f9gllhmh15t86lYP2hT2D
	akcem1A+98IPaQPuMa3IuXOdnX4QI6EKTsA6F9WrTHfW+l5ITmZhrbcM1P8qNKg8
	WiLR3SYQFqb/fWb0BuIOJT+FEoljb+GR1IQXPyARj2EN5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4jguu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 22:50:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d3f48f35so12211786d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 15:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747608605; x=1748213405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InqaD2zz8IXPbJ4Cc2UGd8YBVpLuDNI5sRhUYI1lQ5o=;
        b=OzqpPFUDL1nt3FKP3nKLwGoH/39V8O1W2tOnYjqYERH+FUxjeMRtXOaRbgMxELJVOV
         Cf6dSZDz74AxQhOx2qJBANPVX+pzr+3oNzKnwabiEKfgk0r4EkQJ6Y67bPp8s4AYWKBB
         cyLQDw10MCArFNuYP9AYroisUPIMyIbpoZNtJJYWADqRtfQSlSe+CrNYWUrWktl3go4z
         o579nFI2+/84FoY6fnV8HacpRe7g/o1GpGi+yvv3fsX8rdaxn/pUskY9hj0vVCYGHu9F
         XVuLe7Khf7MOOylh8ToCAT7Gx2rzxxa9vKnN/qh+15wzHq7dyRAGuD/LImELn3n+bVo3
         2yTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5sgQuSNR/W/R1VVmQs4kEwWfDQUlUqV3AICeOqwyRuFtJ1HWhctKt0TmPYyrdZeQtByI4JGGuokid8Zo/@vger.kernel.org
X-Gm-Message-State: AOJu0YztQiDPoYroMSuUKH4hFbSCcu//x9ykfaEr6Y9RFhcAjJV+D3jc
	bwsE+GMLgq9TWgOLqySfyftMO6MhuGCC1Zm/r1xOZVO/VzgkHyZ4S+bFrtlBznGiJhOOL8CaaSP
	NiT+wCz7RFvmipwbRr33bBML5P7sQhbRraKC0n9udalOGZlojWQOQeM8NmlrKai3tAd6a
X-Gm-Gg: ASbGncsf/taVmT0Xptir2WR6oZD3LLHNoO47Hn9XyDyu7iQBlHe7p7rzYI7O56rdUoz
	HbCrrlk5YDO/q6JhvmexDg5trvpa31sB/AXEVMsej4cP3yMYdANikAMqdTHAgRI5FyORtR2HRrl
	4IQ1tQEd1DJcV3m3w/2pEZviUT6MAwEIXD3yngfvoQ9c+FqFvnGO6Ct3qPYniutIbbdNzW+ry1z
	VM5tiU3w5rmEQssc1iqQWQr2cNT1Awg6cNi95Vpvxcp/7ENullOaSxD3Gpuxpci5cWq4XBlWMTW
	qKEmDw2XBRTKjnX6V0/YbHyF8LULhXjeugEXCUTDTcyJlMfEczzi++hLAtD14QAXsuLNKqLhVG4
	=
X-Received: by 2002:a05:6214:27ef:b0:6f2:bcbf:1030 with SMTP id 6a1803df08f44-6f8b09542abmr153442816d6.43.1747608605133;
        Sun, 18 May 2025 15:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtI/P9Ic6fG3W/Sv6Mi+6qg2rT4HzkrU7ujx4sNi9OVmydEHID9pyDdwB/cwiUhNpxwl1dJg==
X-Received: by 2002:a05:6214:27ef:b0:6f2:bcbf:1030 with SMTP id 6a1803df08f44-6f8b09542abmr153442576d6.43.1747608604790;
        Sun, 18 May 2025 15:50:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b8795sm16856181fa.79.2025.05.18.15.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 15:50:03 -0700 (PDT)
Date: Mon, 19 May 2025 01:50:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 01/11] scsi: ufs: qcom: add a new phy calibrate API
 call
Message-ID: <d7d2u5g3ikhx4plag7fkeeqint2766hjjplr4yoyehvqyfogkm@pcegku6arhfj>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-2-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515162722.6933-2-quic_nitirawa@quicinc.com>
X-Proofpoint-ORIG-GUID: L5E86reFdRvGmCV6dFdlQe5H7iv7sNvW
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682a641d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fB9s-OebfdFJWpWk0o4A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: L5E86reFdRvGmCV6dFdlQe5H7iv7sNvW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDIyNiBTYWx0ZWRfX1NhIN4o12X1b
 iqI+JcxluEP1tkFEjdVqzoF1DFZtLD1TvMCJTX9YEoM04DJDx3XAx850VTbqyUCYXSOJsxtvZtl
 wrvxYdQuyhOkZzpxYt2xiDCt5TTaJFQPmrb5OZ3msBJ9+6sVaEEISBazNBwEGlpkXZbPiUa8+LN
 ggy8CRtAVaKkKrJpDbolN3CBOO40Pe6O0F3yu7ulFtJqx/E+s9AU8YN+Q+4Cr9ix0DVzpS6kNwP
 N/kWcJKrM3R8VLPWgToNiMaqVkURpQ8MJ+MXlv8A7SVSOdRK64ljwaJJv4M9lKTnY6hm/155BEo
 Q+YvbjgdHkfhQQkBjChfY8cYVb+GekGhavI2UTCOGW6P5mNDetjBVNrbqIkyJpM8VDjPXwC10oI
 jx4bAUKwVS7fi/ZWvKlbpevzsd9r8IwN/25D2981MLGuTUvjbwNk8BnN6+8JQsDL7R7WhE4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_11,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=929 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180226

On Thu, May 15, 2025 at 09:57:12PM +0530, Nitin Rawat wrote:
> Introduce a new phy calibrate API call in the UFS Qualcomm driver to
> separate phy calibration from phy power-on. This change is a precursor
> to the next patchset in this series, which requires these two operations
> to be distinct.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

