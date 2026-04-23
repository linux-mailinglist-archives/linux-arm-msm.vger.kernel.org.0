Return-Path: <linux-arm-msm+bounces-104185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGSUKhWj6WnafwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 06:41:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CECD44D029
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 06:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06E893006D7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 04:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92646375AB8;
	Thu, 23 Apr 2026 04:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Its/XoPB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSZEDmfC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B0C35E951
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919311; cv=none; b=PGr1ekYPuDvTzAQGOPhQoM4SVtTbKRTx1jkSzGRUaZ+0zt/+chnTm+JyQiBwlwHgci+bwnkkWH+NUtHHOZuTW25wF3SBjXDZtTAopY8DOhiWk2EDfZwzjIO2UeAQF8rXwIaC3S/jeFojsMsoLC1/cWKeNyr7erws0+HU11KSGcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919311; c=relaxed/simple;
	bh=FOfUZGuROs2skwPlJMdG2guW6ndJVmpYhVVGJEgKWuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUo2cBxmTJQsArEWlEHEbzamACkTYrUPnvd45G7qyDfxRMaSvF+7fTn9ToA7Jojt/2vuUE3sFt/VSqwCa+Y+poTQnpmw9ULvVhfg7KeZZwiZ2B+G182Ye4CJu2D90nXKhyvl/KyRNxyvz7su48ngfzycxmt3VtSd8F5L+Z9bh+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Its/XoPB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSZEDmfC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N4JpA81218367
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RfVRTJ9i7/h8EQlsEloUzVTd
	gVAD55YdGm1HDnmdvWA=; b=Its/XoPByVoMH7z+Wj3tLvE4DYdgAsdR5bermwLj
	K5lFVZnaYvmLqf9vTklE+j/+2pvRArT2G/l/vpkZpI14U6tWMlQ3Zg4D6s2ACEGq
	6nBvKyejPFENBWOEJ/SwlLM3iuuyxIyWGbx70xsLcLjWtyxZMq6bjEjUGLM+Vrh0
	MhYEQ29kg40onbfn0AZWlwD0vjklMrXJn+ntIM9Ij7pH/KoiwZj7ecE84Op5pVxo
	q2hCRZ7c2aSWilC4wYHAHEQTjtoSAqaOSLafNVnAv2ysu9IGZ9o+fKgrVH3olgop
	wYPNjgSrLsvIuR3dObbvzg7gahB/WIgKQSQIQe7EE/P83g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282t1au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:41:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso208459821cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 21:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776919308; x=1777524108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RfVRTJ9i7/h8EQlsEloUzVTdgVAD55YdGm1HDnmdvWA=;
        b=ZSZEDmfCvTX03HKiP9eQjI1yEu9yqw4S5EPwBNP3SaWE/8+VKrHbQlI7kNazNOY06c
         cpBENE4y0uPkSA2QyMb5nt0dRt7ZQQClg3H9UWHGq0H5Y0ENOVoQZYfX4eCVAZYs3dth
         X0bYwqxw/8AZLl9tLjNevZS6R1BkA5WU8L1DUO9gWQvpMF7eGrKXULvY1w04SOImPmjE
         p2/lMfZRfJVdF6zRso16gdJ3AzbCxQsFxVMVnW66DXtbJ/b9eOfBY9SzBcYkOUlKWGf4
         37w7Co1AHSenvFdI3uiaE7kgy2mHlv28anZeBFY+65xsRi4Nyao8xfiWiv71uMmwqk0m
         18og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776919308; x=1777524108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfVRTJ9i7/h8EQlsEloUzVTdgVAD55YdGm1HDnmdvWA=;
        b=tRufR+OPwADmJ3USie+m7DOAhKPcXYI2iYwotZQKS8ysZGeNr1cmEY4e8lCLjBkGy2
         Bg6Gl136Hd6EnquZH8p/jhpl8bBOgWTE0LiE0UCEgzs0UsmTgoG1xjS6UloJhKJfE82Y
         F6hrXS9XOHb2iqHIPiF3lDEri/I75MU+kwR8IBGr4iO94ioX1FaJckAvoOunkE+dDwgM
         R4fhIlgtmn5S3gSpOCLbBptARmzHl0YleTwViVomXbfHWv6v5axiYdkf4zGTwSa16kTy
         /tjliS/QqRB4FDhPQkNkc8zz7XuQLCgCHQFinjlIO9C+6LR+xgVoAVI19e+PEvWH7Aua
         qk4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/zqly8SDqKuDgwX1TsR8WG2tKVyA8biL5jNRjvSUF3MNQB1H5AiaGiX33MqgyEcbJ2ACBZvV2+E0WEtpPD@vger.kernel.org
X-Gm-Message-State: AOJu0YztLy30AR15luSsWWycTxNoDa/0+XiqZVgiWZB1EMMpm7REv44r
	Er78Yl0AYbXb1XpsRogVUDBNtAySWW42my5fogZQkHFKc43cXtrGo8PMDxmcLhznkPDRU2AXIJx
	T0NgpwZmyyXASLCei9QlNM1TkAov2JknrNXgScty06qg1zVZ2iiw+8cRLxn8GIW2emZVV
X-Gm-Gg: AeBDieuBDm+M6jL5QF0zxHrrwJlz1evTDzzH/2vvTcMplWdWXFLyaTsrwEt9/IodCAx
	W+YV7ptEfL8Zfil5lNlE1ZPxNSvTRQFSYkSc/zbVYyKs/bN2SViEerNQb6rKfCi0wzfbJfEDpPv
	33HoYpPk1pChwxnn1xjgoYeqLmLf37TCtLJR9j+r0+T2O9KzRP7RAnasyeNL6dUzyhwX9aUi412
	ncoqDcA9qadDfr3oR1AC1O10pLVxTvgqXZfjGJTeKSVs0TVZ2bK5Nr1fAxKtJ92XWcsGjJw9R6k
	XxK8mzK3eNJxewXoZtx+L57tJV+SXulBUuVcT1Az8xq78WPZ3BT5XEUAnFCGia5UoypFok8PrYM
	GWK+Gg1M2/Gmbf+ubF8J5MOVxJ01VIYVa6Y/O+0zpUXZrxexvDBmKwzFSE77SBae+Wnnb8cdUx2
	ocEWk6RBDpnTjUuygrhvoefYmwopeu1dg3AdoXUV92d8/dwg==
X-Received: by 2002:a05:622a:8c0b:b0:50e:62ba:3fe1 with SMTP id d75a77b69052e-50e62ba417cmr191124471cf.27.1776919308624;
        Wed, 22 Apr 2026 21:41:48 -0700 (PDT)
X-Received: by 2002:a05:622a:8c0b:b0:50e:62ba:3fe1 with SMTP id d75a77b69052e-50e62ba417cmr191124251cf.27.1776919308187;
        Wed, 22 Apr 2026 21:41:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7ad0sm4824736e87.58.2026.04.22.21.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 21:41:47 -0700 (PDT)
Date: Thu, 23 Apr 2026 07:41:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] phy: qcom: edp: Add SC7280/SC8180X
 swing/pre-emphasis tables
Message-ID: <ocydv6bbja7z46yjidtemwxtvwyxc4jpmnsc5uz7eorshgr36r@v4e7oo4sgeol>
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
 <20260422-edp_phy-v4-3-c38bef2d027b@oss.qualcomm.com>
 <df40b4d1-6133-4d49-a7e3-47cbb2b058e9@oss.qualcomm.com>
 <cbfa3db8-e500-42ce-8302-16af7b19afe1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbfa3db8-e500-42ce-8302-16af7b19afe1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0MSBTYWx0ZWRfX6HXmK0M/7aC9
 wRdTBq8pdet63MG94uu5nlTmIi6TQ5wjMyeasHLbGjF/9+u0CxKD/KPoROcVR0cK671IPvXw0tH
 O+yQ7XQCQiNf2l2gZWQs0J/LfZ0Q6Jmwg8hOPE9i0ou/vu0kpJJ5Ee0RVrb0J9yXbYE2q+zpoNy
 mFwy08BJWZP+Tq1URUArbdpI4zWTHGB8U2ZlWc6uYTanbjDmFST/rYigU2Lfb2Rz8n2zu1Ruzd9
 QrDZE+tWkm2dVdqvizG7kDdsTGaaujrXoUd/f/0cfqhsdI9QKz4tNE4quenItSOgSyKNBC5inUL
 NfvPnjym/fxglceHfdVCQA3e5IC6tuDDji/E9xpYwVgKoQi61c4NSf4Hu9xYOaIbLCWsVGWflB1
 Hh7747XFxNUmacd8bEiftpMlc+YbW7sv0JOyJ4uU/CIlUQFWk8r2NY0IrPZo9ve4nRVactLXVJO
 QrCo9dvDYB2Rebr3l2Q==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69e9a30d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=O8PEnLJ9UUEzgAO3M0kA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: zy27PpHmRx5085r9CDZSnFfeWbItFncQ
X-Proofpoint-ORIG-GUID: zy27PpHmRx5085r9CDZSnFfeWbItFncQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230041
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104185-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CECD44D029
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 11:28:44AM +0800, Yongxing Mou wrote:
> 
> 
> On 4/22/2026 6:42 PM, Konrad Dybcio wrote:
> > The swing and preem settings for HBR3 look OK
> > 
> > For DP / low-Vdiff:
> > 
> > .swing_hbr3_hbr2 OK
> > .swing_hbr_rbr - I don't know. The docs are unclear whether the same
> > settings should be used for RBR and HBR3, but maybe? There's a
> > separate table for mini-DP but I doubt there's any poipu boards with
> > such a connector (maybe some obscure ones)
> > 
> > .pre_emphasis_hbr3_hbr2 OK
> > .pre_emphasis_hbr_rbr same as above
> > 
> Thanks for point this, so pre_emphasis_hbr_rbr same with
> pre_emphasis_hbr3_hbr2?  I also don't get it's RBR or HBR3 from phy HPG. But
> now i think only eDP will be used in upstreamed poipu boards. i check the
> dts and not find any poipu boards will use DP mode(or mini DP)..

After checking the HPG, could you please actually talk to the colleagues
who brough up the PHY on those platforms (with the downstreaam kernels)?
They might know the details not captured in the HPG.

-- 
With best wishes
Dmitry

