Return-Path: <linux-arm-msm+bounces-100481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH/MM773xmlvQwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:33:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3900E34BBAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2915300F5CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D386039A06E;
	Fri, 27 Mar 2026 21:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJWAoEus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GgzZiX3r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD4239890C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647224; cv=none; b=ka5XhfvV7deyEArPCzGrfObUwrCAXIpItOHzjdO2CZHyY4QGl0wWsciYkSq/r0NoVI/8U4DnBAaqCG/j/X+bs+wm/ivmMr9AM+0uKLBx3pr+MnMSyhuI9HwUcKlimfUd3r3Ov85Gl95Yk9IyoUqpp1XthScXe1nmzgxZrrIRPZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647224; c=relaxed/simple;
	bh=G/NWZGW9c3/9L7BRd0J6hKFCfS3MWwJWicxI2gFlW+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGetC73G5UmiMN2T+9VDm5DIPw20laUqtCQvwSi7CniSJIvLRrGfTzGvaBh3Z253UuKuqdnI0Pg/u+vkRam2HftYdsm3ySSKF97TMySd4BJM6rhrPwjoK/DGEdlyRenKFIb+f4P9uM142RC83seYusM7SKQBGZdbqHu4IJjAzZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJWAoEus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GgzZiX3r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKtWtv2593115
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JkD5/e5PlfbVCPnIJK6O5WGSSIEFcuniRpfW4c/tKlE=; b=VJWAoEust9LgiZpg
	Z37KSkWXfwn034u+uMeQAxvjcy1pdYlF9dkLZrH0sj+69ppvwFu4brR0tv6PhN05
	6oBVFA+oLpSLZEPH4DvoK+HXIWTmW+fX7Bcrjl0eKH6w57mibQmqLqoRTe2+MLlZ
	3Sc6ADa0srhGyidf95VENQmYQMoMXQ41xdPWUBXqEjYIqREYTKAXTh5dF4Y0r0Ic
	h2Tl58c3MEALhXpoalXDumSnzdomVPv6bcKjzzrvB6fgSIlG4Hmnd2B6TPg7Bajq
	z4i6TAoH8kG0R0fD1sWUXFdT/T1Sf5C0xV7qhYl+Ze7incEuZFfCHHU6P+r5QFlq
	V8cUPw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5w30s0ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:33:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917996cfaso25503491cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774647222; x=1775252022; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JkD5/e5PlfbVCPnIJK6O5WGSSIEFcuniRpfW4c/tKlE=;
        b=GgzZiX3r4j4wwtk3QFmPXBh3WORITheoaX2xMaNdjyNyPxOdx+208m+tAjdd2jh8Q0
         P5Ms0FA4SezwHRmHesK8rvN8U7xDFiCr+HXFj9zvGzRZHmE4uDdAFZ5yjOl7BUh0ZcEt
         ZdHok44Hn0zRlb8p7r/Efor2kLUF7IjdMvcNAJiX4Z1Wo3LssBh5DF/7i7bayVcUpWP7
         nowX4aSy5QWliKdDFR3wPQ7J7i/SBlGxg2ZyLCpDgA3EON7yegRdgbugSdUwKDsB1SDW
         mwj1yXIbMIMDfLIU0Y3Ho/AXgSoqthWySoNJfe7UoqAB9RAXco2kbIusGKOCM76X5qGW
         vesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774647222; x=1775252022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkD5/e5PlfbVCPnIJK6O5WGSSIEFcuniRpfW4c/tKlE=;
        b=mcQp/izCwYqh1jr2KxuDCPPtnZMn1ItdJetEFoDdg93e9fAPNaFMfGcSq8fEwiDCD3
         /D/qMbkMpGjqsN0VHGkOWHczJ8PqiKGU2suoYDcH74BU5Ooy0UgPpT0nhTRKZO6gwRIK
         G+UFukzmAozOpQYZ/pH2TgowvTdZ1Ei2DUeDhm9Xa8M65420YZdTzLWSptpYsPohIIMZ
         51/PKIzDes5pyPoRDhcAb5aAUtGoKdKQodqhDosn15zmCDVMEmft7lQv1RY6Dyt/z2R5
         ViVu6uAv4a1wJi9KcQjA+nupJYwwSF0aLpFvA9aQdVyhCHoG+yGVrSb3uCV01AekWdof
         AVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxhqqtVSzTgM29L6HgoYmQTmPhqdJltg6B4PnQ+vsAvxXqvx2YV+WLW7iinAJ5DWcfm+fzKS3CpJ13or1H@vger.kernel.org
X-Gm-Message-State: AOJu0YzEj6rqQTaMmA6UcCqBixVfaLGI9BEUImwZEmknng1EWeqHz8ul
	BT2WVEvnUo1o2g/UbfAMow0SOx+0OoExFcWDZsbeNDyFv/Ix1Zp6Ot5Q7D12Q3XvyBQpgd5K4HF
	zv8v1I+V9UBS49fBiHFt6Bjg1/IWrLeWoLg3K+efshmOJcH/LU5cHjojJftaA+kxzuFHu
X-Gm-Gg: ATEYQzy8HRCiD4l2AFMVet2VVuXstpvyBsuUeU1p0Y4taYuKgdVzLR79Lb3kOKwu26G
	JK4ImIdvjtnA0a4nKCAFMxkeb7ra2gur6eBTIQxMcI6B3RmPqDQoGpFV32J6PsvlkrUUdRheUZy
	ExGimyJSmXjPQL3cXZ9q9V3SFsIAy//hSKc/VbmbH0Mo3XWHITKCwYXhpDYQw48deYo+DCE3RWv
	rlPTXDtfL9SbDUKIpclavqzUeuksxvohuHoORuKKGNMSHK//LUse0/dCjK4ILy0zwSkdlbAiby8
	3HX1yEn+bzwSdl8IrggeXaDmz1Igkm7KBha7C1gifym10u1QwavZ7/Wp1jK+geYoFSuGK1UJ+4J
	qWD0dbVKkd3ChsspqV09eScCXUkxri4lLVJ6mXN07CcnankX+7R/fTpBr7xOTHYg/7DBK9dCFn+
	QMNXGZZKGEJ+2vL+A3/Dw6+gVYhWJFSfwm2dM=
X-Received: by 2002:a05:622a:1a9d:b0:509:1a36:6ad9 with SMTP id d75a77b69052e-50ba3813246mr54400871cf.30.1774647221823;
        Fri, 27 Mar 2026 14:33:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9d:b0:509:1a36:6ad9 with SMTP id d75a77b69052e-50ba3813246mr54400481cf.30.1774647221375;
        Fri, 27 Mar 2026 14:33:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd008sm40385e87.19.2026.03.27.14.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:33:40 -0700 (PDT)
Date: Fri, 27 Mar 2026 23:33:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
Message-ID: <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
 <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 0Y1Q2jXgHY9bdb3OjPnHwB-8SboYJTnX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1MSBTYWx0ZWRfX6SeUOQK8iQ/j
 yPw7kBm343BHYi/9X9Jt6ylyv192crS4rHu9wmpXSkN5Mx3IYODhUMW3n0FHferPIJUrsRhyd1m
 tDzGfO+/ZBhq+auBYc8QM3ceV0Z/sKGScHD6Fb4FtvRdudGBpkiut72Jmm0S/IBiO8pDsg85mtt
 TlnE2qujXNm70QtJRLSQkdVLw8waJqs0liR7oNfi+VMm24BzPCLKDMBUrcU+8nK7nmmSLzsxGJK
 1SzkU2axgxqZnWawIH19xMoJfjer/AGpGs2N+EhjFFuo7bwFAZ4Xpx+WDCEmKDAirASmO7PiVuq
 xby1qmyiAQV5u4o+bLRXK8BLBrURwvHf4Gbo4sa7J5/oyB355paYuRKqQWVKybmDx4OAT5YzVA3
 9hGnnfpTq1jS0crQbPzzeMEJv0XtndSsmlvPnuD70Dp9izlycMrS3gHaRNwzJuAdcy5Op2flge0
 Omhn1IhbbQdOy6An1Ig==
X-Proofpoint-GUID: 0Y1Q2jXgHY9bdb3OjPnHwB-8SboYJTnX
X-Authority-Analysis: v=2.4 cv=F9dat6hN c=1 sm=1 tr=0 ts=69c6f7b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=8sstYimgJ8ds0kvrxP0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270151
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100481-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,linaro.org:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3900E34BBAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:22:04PM +0100, Loic Poulain wrote:
> On Thu, Mar 26, 2026 at 2:28 AM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
> >
> > Use devm_of_platform_populate() to populate subs in the tree.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Other drivers typically call the populate function at the end of the
> probe function. In this case, however, it is invoked before the main
> resources are enabled. I assume this is because the CSIPHY device
> needs to be available early. Aside from that, it looks good to me.

This becomes fragile. The CSI PHY might be built as a module, which
might be loaded later.

> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> > @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
> >         if (!camss)
> >                 return -ENOMEM;
> >
> > +       devm_of_platform_populate(dev);
> > +
> >         camss->res = of_device_get_match_data(dev);
> >
> >         atomic_set(&camss->ref_count, 0);

And this looks suspicious. What if drivers for submodules are already
there and start probing once populated? Do they have a chance to access
this ref_count?

-- 
With best wishes
Dmitry

