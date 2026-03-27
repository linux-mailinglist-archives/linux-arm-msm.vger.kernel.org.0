Return-Path: <linux-arm-msm+bounces-100475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGu6BD7yxmmpQQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:10:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E52F34B886
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E848E301693A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3BB39281B;
	Fri, 27 Mar 2026 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdUM0fI0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TSFWPkrr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DA52D7DEE
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645054; cv=none; b=STMAmKJTV+eGf4I0bJm16zoPH5LxKkKQf7w9lq6bLLYmT+uxyDYHMD7aPgUtBZzfJLefYaWGGge7rbcJSa2MyAt4AYxwaIE9F68QlCVCOfI43lxX1dnppGpNbTJfp3fq7E9fCJAwCdp20h17uvYy0iVk1xZRq0pdIlsUrkgJDyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645054; c=relaxed/simple;
	bh=xkY3sEVUF2rkeLsbj+BFNt9j52OpyLbH5h8LqQDzXWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=es5gs/sODNiOIGG0nXB0rQlyaxSGZXEXJdg78ji/3Rq8dwOiCb8NifP6fSI8XdSGFfl3lZByTc83r3I8ZmAWXxgoQhGEbrpsQohuO9kvWf7x1bxQcYsN/r4+3V3YxEpVUAIxpZN7911xHTE9K27BiYvVufjJto/Vr6n5az0zOFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdUM0fI0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TSFWPkrr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKtuF0452415
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hTL8fv6F5+YUvvE9I81wouOi3oe8icc6uFeLj6rzIg=; b=TdUM0fI09AxvJtGf
	FcjzjcRSYewmqVNJ38IVNdKBO7SlsUqhrtmrpJtlTpUwRRwj79m/AcukyY4HtVXc
	yEFIVR+vK5UCi47JIcnpLBD+PclvfJ3nXvs8w546fAu9ZS9QCiyd/a3m6YlHeTj9
	ShhsKJt7IpPEJzuZwa85WF/YLIdlhHipo7GoC16VSfG5a8FdLkBJz1/zlmu2qCiH
	6bHru+G1jjR4eH1Zk6zfjar6NwZGvcrx/bAwwGLE9hWy40zBuwaUIcxbd5wVIX68
	H8wB4h7T7mwQRG7aN+Hz9U2Eb9n4L8xsEY0+QhdqrUvjSqs5sdZ8T4HJJSff8+r/
	jRgFOg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx3fc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:57:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso117184921cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774645052; x=1775249852; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9hTL8fv6F5+YUvvE9I81wouOi3oe8icc6uFeLj6rzIg=;
        b=TSFWPkrrWP2Z43yTxRkFF9QRY/3Eq8rBFHNxmisGOx4G5DeChmUu+v7/UHLhbhX787
         87igFV8ur75+wbrRF1EgTYxyE7AKudA/CVFkKvmaXFj812dQRxP6fAgKXKO1ICCRGTJg
         lcHUUdhX93J8S8zffa1tCoYkCk+qaiY2/c3Ng8Pwn80OzVHK5StaTM7nIBYjaFM1r9F8
         QIl8y1lJICMUq4AtRb0MQTRXF9fbNhTqbJDYLKAskoP3bDM5qxbftsHSN935yZVvfoNF
         5QDM3r2G48CBsN/bvMh3qn4tw1VzEQsdFckI/PbGegOxbxdxjlIT0PxBYByLxRWHNL5q
         ZEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774645052; x=1775249852;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hTL8fv6F5+YUvvE9I81wouOi3oe8icc6uFeLj6rzIg=;
        b=tSRwelfz6obCE6kzZnCAyXb/3JLeaxga3PM0DI5K30egYDTI9itJP8+mStENOgOq5s
         LvXruoX8XaMWvXguU+yWTzIOsxR/4shwxFeC8NORcx7/rypQwlFuRy8m3y3rIZ/5Cb4u
         VTgkoe1u0POxNXPb362oFyML1xaHRhVAJ6OyZX1F2e1G5EBwUxPLLQBEvD1k9Fo24nUh
         /VHOz/tJxRXWTt0KtrFspHT5eA0vPVuI5GdBzja3k8afFIU5OkdDslK0v/U7anz99IkF
         gaXK3GNPwvFqXyhCfKHlD5Q+aVbZ1KM/5byFBP+0mmi7PJUjqBzeDnSI+scry4HEmQJL
         QvGg==
X-Forwarded-Encrypted: i=1; AJvYcCXH7QhocozgFkXf9+MJ1Dy366Kj0HbZfD/YVfjRxdFfW/KgAPtSU9Po1mH15lA/QH6N7IrZo1HVTFTZNghu@vger.kernel.org
X-Gm-Message-State: AOJu0YyDUIVkXzQt0DxqWPqYDqVl2xThRQF+YpmglyxFiux1sstMuOV/
	08VETY9DnVSSHSmExs3DoIEsw3KltCy6tI2WLsQN7eJEuMdyYsMEz6gCiw//jPlfZsnHMOBBThd
	1uSmNQ5ZtNDCoN23L+GycFwf5QcQZ9FVlnw29jmgkwjWqo1PvHpu1zgHtp4XHG+GNmsht
X-Gm-Gg: ATEYQzwH0KO/iWiuc0u4O7gdfsDOCBXYcIfk6kBTFYrMeMnKh9Qd1NJharilNTYWjV3
	Mj6v/j2u9wMTbFKm76ce3lF3jp0t/jIIxPPrFOradYlUF+K6zMB4OQX77YKL/NLfSDwj8O3lEnV
	TT9yo7sriNw3raqN9dsASBk77Q2wbTwWeQjmCh+4wnfgLDoeIRHxF+jRHAs4owc5lOS4/RGvlO+
	mE6xGvWT4Owtjr/bvS3LBTsHktTqhqsK0VtkqhGE+xb+y8ie/5BxM5foQaapOGk/L7G/sdHWpwK
	OXM2xEBr3iyBpXWl7kW8L2cat98TNJLwfP4+kZ0+/2slk4jPh+ocsP2U7S3wjsMFU3F5dkYLmz8
	hgzQMBZ3KTs+oiwRqANXJcd9+2WCndrunci7pj+LMI5KTAxcO+BOdRex8ISTD4vQWsJWQ2331yL
	pbdNjUw2yJgXoJViL0iV7rqyTl08LYq7Uw3Uo=
X-Received: by 2002:a05:622a:1b86:b0:509:e46:84ea with SMTP id d75a77b69052e-50b995172e5mr85163471cf.34.1774645051694;
        Fri, 27 Mar 2026 13:57:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1b86:b0:509:e46:84ea with SMTP id d75a77b69052e-50b995172e5mr85163171cf.34.1774645051210;
        Fri, 27 Mar 2026 13:57:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931b9sm731601fa.23.2026.03.27.13.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:57:30 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:57:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <pnoln5mv27yuwirh67x5slhvswy3iv7q6tlzoj7zvaxtrpgtgl@bom6zvjrbkwi>
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org>
 <bc6abd24-d56a-4fc0-89e9-8986e8d8b3b7@oss.qualcomm.com>
 <27adcbd2-0ec3-4a8f-84d6-ba381a66772d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27adcbd2-0ec3-4a8f-84d6-ba381a66772d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6ef3c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=dqlpYPTLeaRY0p4CLEMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: NEeS7bBFvsMAM_KQJCJIPMng83gAruop
X-Proofpoint-ORIG-GUID: NEeS7bBFvsMAM_KQJCJIPMng83gAruop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0NiBTYWx0ZWRfX5xv7kq/vFPGU
 oQ+gNTmDXGpGnYv7bbGYsEisF/lVEsJKi0nvu5/iM1jFCAVMPotVqPouFPz22np+cHcOqDridQ0
 zSfDBKFpqHxnyH5/SiVyRlf/siQ0q+kYmWmeith0sHx2upNbXyis60mgooHIQjpp/2mukIhjPL/
 j9J2CFpfw9Vw5B07k/MReQq1h/nnNeBw2i5dDl3EI6Y90/4ZkBf+BLp2f1897rJoU8LeMpKh1li
 ngXxyk2RPduhwjTTVTYaxWDOKUu1cAfiYBALYMF5NW4I29eFb5slmW+5JcpZyiOJKwz5NWKHiI/
 DwVzIpcf+cb30KJT6cZVF07XSm6YXnVOY25LTjAxJIwLeNISCngrKvBilgVl9MA7grzzgUtnynZ
 v7uHu3AhCl3zXKPcr28S4cSIN8ou6i2BfyFQ8DftlWBNWEuwiGLjNloiuyK+EerMYyuEAALB4aj
 3km1m7BK8kHCA1fo+Sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270146
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100475-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E52F34B886
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:07:53AM +0100, Konrad Dybcio wrote:
> On 3/27/26 3:23 AM, Hangxiang Ma wrote:
> > On 3/26/2026 9:04 AM, Bryan O'Donoghue wrote:
> >> +#include <linux/delay.h>
> >> +#include <linux/interrupt.h>
> >> +#include <linux/io.h>
> >> +#include <linux/time64.h>
> >> +
> >> +#include "phy-qcom-mipi-csi2.h"
> >> +
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)    ((offset) + 0x4 * (n))
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET    BIT(0)
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE    BIT(7)
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B    BIT(0)
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID    BIT(1)
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD    BIT(0)
> >> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)    ((offset) + 0xb0 + 0x4 * (n))
> >>
> > Hi Bryan, one minor observation on the following macro:
> > 
> >     CSIPHY_3PH_CMN_CSI_COMMON_STATUSn
> > 
> > The 0xb0 offset implicitly assumes a fixed distance between the
> > common_ctrl and common_status register blocks. This holds for the PHYs
> > covered by this series, but on some other platforms (e.g. Kaanapali,
> > Pakala) the offset differs.
> > 
> > That said, I think keeping this fixed value is reasonable for the scope
> > of the current PHY series, and it does help keep the macro set simple.
> > It might just be worth documenting this assumption (e.g. via a comment
> > or in the commit message).
> > 
> > Alternatively, if future PHY variants need to support different layouts,
> > this could be made more extensible by moving the status base offset into
> > the per-PHY data (similar to other register layout parameters). But I
> > don’t think that needs to block the current series.
> 
> If the register contents are generally similar but the bit positions
> and/or reg offsets differ, regmap_fields may be useful

Or platform-specific set of macros / reg accessors (as it was done in
QMP).

> 
> Konrad

-- 
With best wishes
Dmitry

