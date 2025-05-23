Return-Path: <linux-arm-msm+bounces-59236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA23AC2893
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1D86166632
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FEC2980C0;
	Fri, 23 May 2025 17:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6nUPANF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D64297B6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021146; cv=none; b=TMkDiJP4uCCAepO8L7TRsDfyoz+EY3N/4ab61lk9b6JLiOT6Ct0WO2Y8MqRhKBmxfQ1lSOX3YXY39XQyeIYuiN8SAiB/qSlzNTCW0lSz/vxifh0O2M6IiQb9iu7dSUSLzpDRzZUL7zYV3h1OkFevZGpBMAT0DoIWtzUOg865Wdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021146; c=relaxed/simple;
	bh=7rcCNSJVSwEq1xrZ1u5/+ky+mLguy6zK/o7fp7M5HSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjBNpPOtvL2vJxXXC5ZvOcd7pTv7gx4CKVRlE8HPxhs+xp2AS1x6GfJltLpyRjCPF50mP+rdy/MqxBsLz/vaqLGX4u7pF1+CTpSRP/1Hpej5Lru4p0Zg3njS3pE6k5nv7dCcqTt4ifeCKa70ArssOdckQJUEQ4WCWJlDlnYQzYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6nUPANF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFJsoa022507
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HT0F8cGHWEQc238afO9TzLz/
	3SBoXaCqVeKXpo6ggCQ=; b=U6nUPANFVoIfiIjVAy1DYa/qEGq5CTqTkPzfytOb
	vuZaF/v8H1JQzFY9x5XaSVNhyS/X6m+fKK8W6f+oS0eDHdIVw9As/VSiE3+3E7VO
	UsfEg8WVkI+u3Vn1xdESU/35fmlgqaQCEv0O0nwKqxx85bPButM8M5kOKyYr1LBG
	MOkXhzv3U4Dz3pvVFEVPxkkoIqYqOE1ALP5Oa7QSj1wefkbhTIFTrggq9pavBZm/
	R4kZoGjzly7rwYK37F/+0HzyZPPnz5lmBA0Ak/y+ivx1MHZ+lYrOQgbW3+wxLFha
	bU1F0HPFDcauw5QQ5l3hNnk2IQVCXWTBFT6OCw6ruNcHBQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf72k8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:25:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8df8d4585so1114396d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021143; x=1748625943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT0F8cGHWEQc238afO9TzLz/3SBoXaCqVeKXpo6ggCQ=;
        b=RQC4NTqRddJwW9+a2QRmHtNofPHwoi+IibkwJWvbDoGszGrhMS5+eJEFA6hQqdOIVD
         +7EDf2TJ8JgmezNckE5MsQYN4kybGPYZCaMy3/Jl86i9XCb0N4YBFCw+9YrLF0fbuaEQ
         bCIJo2pYYVu/PvK1NTZPscCEhmhA3ZoEou1ZYvuh8BspJ1vIlwsRfKXYJEKRaxJQt3ye
         Imp0l95ITZZ7bXFUF9Bc481l4zeU2uYRUDOq+zWEFons0YsbZ/8ZWO5UCBRzD2K61EXs
         tya8PIHooAfbyvfHinfxVatUpLfPRKE4heT8jj7nWS9du9xlD3AzT6F4Qprez7el+lBd
         VLXw==
X-Forwarded-Encrypted: i=1; AJvYcCXxNPqBaLyIcE2wzxNVCtV5X654SCFS7G2mzwc9ZpRgPZIR62csnhiHlpnYDMYu2Ont/3ZDfV8OGa45M2fp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8m0Ukc1JaVCbdEzFIWkOsTD+OcVY/XL06gb1W2oQV7UwvrWvM
	IkjbPZlpmJk+HaqifQgnzbTD2H0UiRyFu4Jy/bqoqQeeyNW0BbTcjujmRS1ayUtBkL9AM9klWCJ
	PFea5y8SpPt8fJuO5WVV/JzLH8i44dXlBYBoU8BS+F/YhWNVlE4KuEF85pLLJESUs80fu
X-Gm-Gg: ASbGnctbIXO4CbUD+OqeP3ASAbXlUTcAVEUZv+qbKqMWdGM2Pz70CQ2JPqyJtwDfo3W
	NyJTPEVdLE4TuRxPXv0Vnfc03R8hO5Pm0jmP67HmQdtKOSGH0+CO8l3kxqrTJFRd/+wnOp9J7cS
	QmDJ+gD3JjF+qkliPO0pKiZqCcAlnQeu59rmabn1vcn0KSSFjUa7kMPlwsqcBF+1xPzfNtmtJIt
	t6eboU9HzFjkN4G2gRuMymglcOKv730rP9k+NNuWYPfoEEZvx2gqTLvBVIVw8QXUEhBKVzmcTnv
	PGfPDdGDgC/1Omb3OEWBEro2CO3tJg/HgOL1WblKybFKKQElFQtdjG0QcznZAnllqGdY4M/kmRk
	=
X-Received: by 2002:a05:6214:1d0d:b0:6f8:e2ab:cb8a with SMTP id 6a1803df08f44-6fa9cfff18fmr5886736d6.5.1748021142767;
        Fri, 23 May 2025 10:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1fuehJqloS19yc8HH7Owq/jk518Mad4i90LYUjgFgeJsI99YBxj75Y2MxKlxrFuXWwV/Y8Q==
X-Received: by 2002:a05:6214:1d0d:b0:6f8:e2ab:cb8a with SMTP id 6a1803df08f44-6fa9cfff18fmr5886246d6.5.1748021142385;
        Fri, 23 May 2025 10:25:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b9033sm40183991fa.80.2025.05.23.10.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:25:41 -0700 (PDT)
Date: Fri, 23 May 2025 20:25:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v1] serial: qcom-geni: Add support for 8 Mbps baud rate
Message-ID: <fmt3prey5rrm5pqz7wn3p4g6lqpupazbbcahuzp6giod7l2v5j@u64bykj7pi7j>
References: <20250523103721.5042-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523103721.5042-1-quic_jseerapu@quicinc.com>
X-Proofpoint-GUID: QCrlW33_6w83iUOPZszDCzXMFtulYrzg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OSBTYWx0ZWRfXwonzZoVYNZoX
 AAk7smhNeRaKZd8TxYmRjeebrNMqZej9zxTBm7vyoA340DBG71vWYzTLefz3YEXs7gXXHt8Fep2
 2WUXGmivsQGVuA+pCYThyErbtvegvr+C76oU2gxtpG5P9jLCY+Gr5o9VHhlyi/X0r8LzO5xo0jC
 FtLcro5SfNTaTpsTx+TgctZDM3OJrY1G4ZU8PVvhJm1fdTn5GgNLnFRNdHRgWf9dFJd/bTk0d/e
 0EGAGXrMhet5nD/vdE38cZ0tbIYp/2qy0BBE8vb3pJkP0oWWMvM2S32RBqbJZ5wVZCTwI15r0cT
 nX7Mx00GiXx5AyGsymQXfMJM0JrPupM9Cjs9U9a+MJEvWFdPmy9JTfgpsnbuLab4hT6BxZoKXnj
 2wcawS6V18AdnG3QPBE85DQyEsoQM0cDLQTCDO+wkVN+cxucBBF594kv/JvmwpOqB+g/UG38
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=6830af97 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yKaScz8-J4BNzvBwqzMA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QCrlW33_6w83iUOPZszDCzXMFtulYrzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=879
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230159

On Fri, May 23, 2025 at 04:07:21PM +0530, Jyothi Kumar Seerapu wrote:
> Current GENI UART driver supports Max Baud rate up to 4 Mbps.
> Add support to increase maximum baud rate to 8 Mbps.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

