Return-Path: <linux-arm-msm+bounces-99440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP5lMj3IwWlUWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:09:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 328022FEC55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79758301726D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449A1361667;
	Mon, 23 Mar 2026 23:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5y3MEor";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HpX/N+h3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063A479CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307006; cv=none; b=dI44wbTrHC2mTFLpeGDNmbPr1Dk51KtGASPH104551YK74oCArN8l4agnsmxxEgfKaUBDHvHprCwrRAhlimRPpjycPVzOnxxTsoc/ubRXI/5UouF8MWCX7/Iq0Kaffdfnu0Au4ftrdfNh+F3f0X09CC40Yr0nX/O+n2wofJoVOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307006; c=relaxed/simple;
	bh=i4AQKBeNQfvWvErYuLC9JhRXPBXk0SBSvzU+wUSYxqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MssTHlCYjNuE0r7BDr4RA9PdUDNB6M1phc/QbrK8srBOqN5H6DfCUExGFjZfQeX8NTs42KM8Ss9ozAte9C+L5KH5Noq9hTabZJW4fWgR5PJeUfDncT6u0DDQJlukPruqV7a/30JUfH72KG89dPmxpjyAWReE/mdLazoIDQn1q+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5y3MEor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HpX/N+h3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXGm3170664
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j15vUetbclc5OCa/mR02ecYK
	KAhrGcCaswQcVZu3RHo=; b=A5y3MEoreB5S4mf8d9+9Nks9q02tWWLqeKELccKV
	eFQxjh+azWQgnxjxokYyRI22yaXjZ7/R5gXl9BpSzldDS3l2qCmpbnu2nuHNyhkn
	wVn8BkjuaeR1CTBdgJh+34ZrpAZVuIxQXj9yWyVFeMXOIjMFNM7AbKcJDmqaXUpv
	n9N9M0/twSv9/x30mmNKvnGubiLsodpI47FrMj19fpbefYCjUn2acFvr0XZTod6+
	Y2wfov2ZsY/r9g/wJcX2ngRwU1oyZ6J++DfIdAas8xmcXbW5C6IzAgfogKhNwLOi
	FiRY+cnkUdyowsvGBbKcKer/FaS9BstPJpsLM6B2rIVwdA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r22194-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:03:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56cde1ba19cso3227869e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774307003; x=1774911803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j15vUetbclc5OCa/mR02ecYKKAhrGcCaswQcVZu3RHo=;
        b=HpX/N+h3ZZjca/8BUdCzjvGzGf3D0yqSIlEAtplH0dTQoicHdMY56MtLoxWySRrTDq
         qyVEEhp9BFqOxQOL3sqibpaT088dmOVQwmdpgUhin5mPc8+3F3csSHFgub3lfb54+Efk
         csBruSG7u6odxehACd5iu7aaei9qrOgq0mTLyYkBIEf6h0kMHwy5BVHUMJ1NhOnp5nxe
         /IWZo/UaMFAxXC2NUVhsWrVQxk8ULvSX12A0coMK0a1QXagPN4Pvuh7UGApxOUWFCSTR
         cbm9jQ6veXtnf0zGVmqZgF+Ptf5R35pRpU6lfW1aaXPNJGRDOD755oFUmYpEe6Tp0N6W
         Z4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307003; x=1774911803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j15vUetbclc5OCa/mR02ecYKKAhrGcCaswQcVZu3RHo=;
        b=KUGg0sNmtbaDIjxUasG3oKaQPGmnV8paDKrkuo2NlTn1zT4AhUaMu/4MYdMZ3NWZkq
         ga3nXYA2hpiPenzmruIXqUoY8wHBMk0rR3wOQD+HdvEdvXf1CEGrtKGO50YLHDuMePd8
         MaodhrAxwRMXnunu3K75+QYOLqYmmA6arf78Fs9kbAdriiErQTQ7KPAWQgLmqHzsg7yu
         5OQ/TJ3PzVD02opohhh63bmXGuKLiDHFJ5NV5psFjMTgqjVbAMc3ZzMoOrbgIubqU/2r
         Rmx80E6RFLirnR9AI/QlfcOgRaLPpoqFC8jcSxxcK6ORMY55B/mSXc9u7TWoJwDxe+H0
         /EVg==
X-Forwarded-Encrypted: i=1; AJvYcCVOkF6ZsW+ag/Z03cz6EasjNrdyBDmPSmKpw8kR6wIW3LFraECIqtQGN9KuDf6fAIrVCnzk+b3aCX6DMRQO@vger.kernel.org
X-Gm-Message-State: AOJu0YxO3pzc7zjqSVqoIPK65x+Dfsj5tOvnyvPcFXVXnR9EovvL42p3
	T3BH6/CwXHb2hYHHihLTy8kSyHOYARYI/S0povBCOEkdkjSLtT9m4pPy52pi2cusRwW7NgHLKZ/
	pthYWPsWOx9LAqQnH6kdTERphr+KnMsH+yi5N7ye068GFzrlyd0gsvOuMmUI+f8VUsc1w
X-Gm-Gg: ATEYQzy9gFc8TQJyV77Y+ru9+qAcN4XfrPK6Tr1JZdx78JJlLrcz7rDklnker8wQrDJ
	IfLCSlVwPcXrng1sqe188oR9XIuVNP3O4PxogwZ3YBQtM7V0dsef4nv+Ax68YYBGosoY98QxNq+
	weIb6/GhDuYCmlxZRQ7SqA5IP9VKt5RgaihOCtONeqHZwb0ysekSB5cGpQ/va2kDK2mMKBg01mU
	1QX4KtIRFI9lUARVSjUu4GKTUP2W5Hxp3R6UoH8wnX2/o2PsF1uxpfkg35hmTWgVX4EIB/EVUWf
	RfOWzpZHeNZe11EJxmErbXgEkBfFcyEIlgbZRtP4eiKFGfKi1uaqnQojnO36c+BauV7KF5GCI2h
	sOSRkIF+Oxsze097l1LzZDWx9L6CRj9sKo6vU3TAiYAliShXbApIsWsy/Nns9A2e84p7z+5+mU5
	4+WVyi8c4JTnjen72LI6Iv55DSaUmUFwmi1cs=
X-Received: by 2002:a05:6122:923:b0:56c:ca50:e963 with SMTP id 71dfb90a1353d-56cde435522mr5978605e0c.14.1774307003378;
        Mon, 23 Mar 2026 16:03:23 -0700 (PDT)
X-Received: by 2002:a05:6122:923:b0:56c:ca50:e963 with SMTP id 71dfb90a1353d-56cde435522mr5978560e0c.14.1774307002699;
        Mon, 23 Mar 2026 16:03:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192dbfsm2807778e87.1.2026.03.23.16.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:03:21 -0700 (PDT)
Date: Tue, 24 Mar 2026 01:03:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: ocmem: register reasons for probe
 deferrals
Message-ID: <2hd5rlyqsnypf6pnc6kbr7gaua2m5py5ge5ncwpvs7fqxwiueo@pv2yaguavc6q>
References: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
 <20260323-ocmem-v1-2-ad9bcae44763@oss.qualcomm.com>
 <acEe_CQxxkl9nvOU@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acEe_CQxxkl9nvOU@redhat.com>
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1c6bc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=20KFwNOVAAAA:8 a=wV-IHFDicfKI5wJPFX0A:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: fDc1gutLvgEAejrFPOCqme8F-vIv2mpL
X-Proofpoint-ORIG-GUID: fDc1gutLvgEAejrFPOCqme8F-vIv2mpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MCBTYWx0ZWRfX+JyIr7AL1NJ2
 S5DY0rZK6QJOSm6QAp80vTdkW4AfFnJz7OgWFn/bdsQozMJMQ84UngzwRRjvNiG6CVsE+N/ecxM
 1uzyU/oTpEqIdfDy64MbxO+uss5iZrN+7vW84fbAe5l4hxxfZmiEhaNGtqC2XwkZMsQzvvbp7H7
 fe5VpPqXoV0PK0QfJ2D1pnx0CUORbEm0A/gP/7JmXD0N4nPZYXhTbsWvGQrGB7rKnCuppH2RkBp
 1xnqfaG5SlbjBKU0K3Ec7cd/7WW0TNcxVvj29wb03wuY+RSfXz1U6f8xtm/JlqE2+WFWLVnKGpq
 mBYALFGhCugnHDEgmE5xRCSRkPgwQURs4u2Q9BnmJp3CLrIqYR0nZP9ck3+lbM4ZCnV9R6huAQb
 cXwPafisGWmEGtxrk6o89qx06hmua+hme64Iv2UD2zEwqzOsZ4vh5KyxAJCQ7gr7T7+EH9rujFX
 W+TrNx5PAAoOMG5fnwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230170
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99440-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 328022FEC55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 07:07:40AM -0400, Brian Masney wrote:
> On Mon, Mar 23, 2026 at 03:20:58AM +0200, Dmitry Baryshkov wrote:
> > Instead of printing messages to the dmesg, let the message be recorded
> > as a reason for the OCMEM client deferral.
> > 
> > Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/ocmem.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> > index dd46bb14b7be..d57baa9cfa03 100644
> > --- a/drivers/soc/qcom/ocmem.c
> > +++ b/drivers/soc/qcom/ocmem.c
> > @@ -196,10 +196,10 @@ struct ocmem *of_get_ocmem(struct device *dev)
> >  	}
> >  
> >  	pdev = of_find_device_by_node(devnode->parent);
> > -	if (!pdev) {
> > -		dev_err(dev, "Cannot find device node %s\n", devnode->name);
> > -		return ERR_PTR(-EPROBE_DEFER);
> > -	}
> > +	if (!pdev)
> > +		return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER,
> > +					     "Cannot find device node %s\n",
> > +					     devnode->name));
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> dev_err_probe() was introduced in 2020 (a787e5400a1c) and this driver
> was added to the tree prior to that.

Well... Fixes doesnt' require porting (or 1:1 porting).

-- 
With best wishes
Dmitry

