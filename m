Return-Path: <linux-arm-msm+bounces-59179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5DCAC1EB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8842503D31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB018191F6D;
	Fri, 23 May 2025 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5/Sqj5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF2E130A73
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989167; cv=none; b=ZwwB6HD2ZtvcAws6K7q8LqF9c2stpwIwReK1lXiz6+iCY76HdKtzsoZR8mnksJcu5KcECoNmHB0McT5MtbkmqbawbqnJ3/Lqrkl6gGdy16xNfthvXvvrVA7lr5ldyJu7GD9kP4TNHiT1LelTb63Ts7SCwqNmfgRB+KvjdnOXkvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989167; c=relaxed/simple;
	bh=LdoWqX6NJlGXXSJ+cYlzEBZpHj/7Qnh1SeCOCqpSn2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcsqaJtr9sspjpW5gZ0IGGm5EDNqYSLuOk0e7/2QDkX+oz2BUEVJK2zW7s44H2XI63DFiKyEchlawXqXVj5POcrcscltevZn1nMgI97KeFcIsnU5UhcRkJgeA/8yFhGWZDLleY594IKNdnvKeK+0EVJ8+Ad91qhk34i7r3dzPrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5/Sqj5c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N3rJI5006644
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oN63icDHKIbFtc/MXxoQJaV3
	/1PeVKuJUchWHtMFzZ0=; b=e5/Sqj5c+vDqdRem0jYnNWf7a1jNeD54lvHRIH8X
	eCqMi5ZJ/t3oCEb6RbODAoEMBvr+O9BkJ2alQ419qtZmc/jh2E4f5nSj+iWYkBAO
	Ye5WZBs9n+X5bErvnYRX0X6WS5Ml7WGcT4djfa2TcCzxnTgGM0323o2zBjOrS1fT
	K0gqlbDSEW5GiqaGp2iqAC0umII+AurnaHCl7ftTEh+yxywAq61E8n+G3VsSp2Hp
	hY/Etz9nGpgNl2jQT46h4HwHUotTOXPaD/sYh1lMAp6XqK4L2hKSBGffQDYAW0yJ
	MeKcat0qlJlOvzY1IFvi+hDOAtBAFk7LI9HKtKaRWfl/fg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0sevn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:32:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c6ce05e0so92904396d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 01:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989164; x=1748593964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN63icDHKIbFtc/MXxoQJaV3/1PeVKuJUchWHtMFzZ0=;
        b=YKTJfORP2CeR52RhazwnGbBx4KhsEeCRYG6TjgiokMr2RD9UnGZKfE7C4N22h3GCuu
         oyfsJBJYjJEqP+n2t8OAvC0TOA6IH1WTZdDdIVv7zl13v6zU9D+oLjmJaEfrRqM/THMd
         c2hRyar5sqrl5RuYVD/D28I5sSNDgPc1rxW7/rjjygdrsKxj6Yvz2GmVIhDR6lOqqqSt
         bNPz68UY4dU6Q+fcaAdbjwmD8c5kVhabLrRxDZfgqFX3yXrEGLZ1SmZOP+S0iTqd6PFk
         R6FoJ7D4NQXc83uOlQWeSsEJDn9O72qgb9PEZrlEp3jpxiK5shzJukT8PtVUth+bKIxt
         2QTA==
X-Forwarded-Encrypted: i=1; AJvYcCVvFFdkRmdV222M782B3Aum0qchvuNESriV9H8Q1R5J1Bjt8VuM4GAXrH/I3GhVqsx9oeUEePmG/yulIrKK@vger.kernel.org
X-Gm-Message-State: AOJu0YzY/BRUirh8Azy4tIaH50V9R97JGJih35pxjOoDYOXQKME+lRXi
	RHlsXUxBGmHGY8u3MKQCBhKsYIvuMjoacM9GESZUa93QgFBvL+RKkHwLt6nh5nQoEN78VgAknIB
	f0Wqz6CBzru0vv8bYU+++k1QjhzrixYvGRjEi7fHt90FnlanZ/2QV5efXuddpFdvJrwWc
X-Gm-Gg: ASbGncsBTIxyZZa5KGy6v3zmrUaoBuc42flA7Ezu4vPVrfsGENSMT/lQt3CFRqj+j8+
	pLruuCRe4vpgH+A1B24E0FKlr4JkgfWJySwBpAJOi3S5TlfdtFM+WixUYSCOrq2kqDvIUR+6kXX
	QlvfJkm5LTom2UUEO0eF1KKXGa/LvOcF5lWiJ9hzebNCIHHUYvUmzAQMqvclxo65OnvvwXfB4XY
	g8zcX71Xz/9ooic+t9F5dlQ74iwloIdbRYOZEU6oCMBbhoKCeGWt2pZaWmVubZHOfb42RrYLI7x
	EDIuWmTvlpjNxkGfFc6wOvi3gI/YeE3LHMv9Ehzm2ehq5y7me6I3WPRtq8Hcabt5C+AUvZeX0VY
	=
X-Received: by 2002:a05:6214:21ef:b0:6f8:c284:45c5 with SMTP id 6a1803df08f44-6fa93a29ff3mr32691056d6.4.1747989163925;
        Fri, 23 May 2025 01:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzHTCxZit13oN6zSMGIZl1Fu32GVKPLOoageiYP2PzAGpx1HdKcURrKQQL9zO1TSMpvPVbFQ==
X-Received: by 2002:a05:6214:21ef:b0:6f8:c284:45c5 with SMTP id 6a1803df08f44-6fa93a29ff3mr32690846d6.4.1747989163545;
        Fri, 23 May 2025 01:32:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5521685d1b4sm268277e87.169.2025.05.23.01.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:32:42 -0700 (PDT)
Date: Fri, 23 May 2025 11:32:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: fix endianness for QMI header
Message-ID: <pi2ce45jqijxvzchjmg5ze7zpxz6peeyssoybodwen2fh34w7q@jh6i5pubaniz>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
 <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
 <vf7fb7jxxwy25wzow4pbzvh26xqd7hkx4edqmcts2tzoyrnxqs@u3lev7ergjb2>
 <aDAOXo/ujOcefs04@FUE-ALEWI-WINX>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDAOXo/ujOcefs04@FUE-ALEWI-WINX>
X-Proofpoint-GUID: DGpfMheJBFS_H-YbWd7Q1S7JhjApw5LA
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=683032ad cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=ygGBFQutPZ-PvdxHU64A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: DGpfMheJBFS_H-YbWd7Q1S7JhjApw5LA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfXxEEAyzDFHzNZ
 B4A6EwaL5fVrB/UBzgIMIpXP+P3rASKANTXo6/4cG3eHlvIvbaM88UAnjB8SSOhn7Vhhj8yjomc
 XHSRy9oUrD70PvZ5rf48l1WPTKE8d4fNboLfrtpBYF02w0JZffjeVXYGNZPwHEq6rQJfv/Mkr3d
 XyuEb/6vZp4ilAHZnou3GcQMpSeegmcIPUOP5ZABUNxyQPjEZeAFtugrIKbGqnFPEr1B34U0rIH
 xas+WascaRbF5YG2356jjGWJByYMjUHg48I0Ad5h1VgFxIxSeI+NQxmGlVhvUci1Hh4uTQKgI8o
 rc0IXAGj6gDf0etd+YD2p7LK9wq5BcuABGAA+1gF7VfjVkFpenw3ldN4HD1W8lBw0toHsZOUK/T
 htgwJohvVOn+Y3PbCRIZ/GgzqNWGwUEz6Tw1C98XI/bbozkv/Jkcgd7+K5EDPn7MURYImrKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230077

On Fri, May 23, 2025 at 07:57:50AM +0200, Alexander Wilhelm wrote:
> Am Thu, May 22, 2025 at 10:09:13PM +0300 schrieb Dmitry Baryshkov:
> > On Thu, May 22, 2025 at 04:35:30PM +0200, Alexander Wilhelm wrote:
> > > The members of QMI header have to be swapped on big endian platforms. Use
> > > __le16 types instead of u16 ones.
> > > 
> > > Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> > > ---
> > >  drivers/soc/qcom/qmi_encdec.c    | 6 +++---
> > >  drivers/soc/qcom/qmi_interface.c | 6 +++---
> > >  include/linux/soc/qcom/qmi.h     | 6 +++---
> > >  3 files changed, 9 insertions(+), 9 deletions(-)
> > 
> > Just out of curiosity, is there a usecase for running QMI helpers on BE
> > platforms?
> 
> I'm not familiar with modems, but the wireless drivers ath11k and ath12k use the
> QMI helpers while transferring the firmware and boardfile to the module. As an
> example here is the log by probing ath12k device on big endian without a patch:
> 
>     ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>     ath12k_pci 0001:01:00.0: MSI vectors: 1
>     ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>     ath12k_pci 0001:01:00.0: FW Ind register request failed, result: 256, err: 512
>     ath12k_pci 0001:01:00.0: qmi failed to send FW indication QMI:-22
> 
> Similar behavior is seen with ath11k drivers.

Ack, thanks.
-- 
With best wishes
Dmitry

