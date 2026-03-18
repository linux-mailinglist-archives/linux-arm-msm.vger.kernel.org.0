Return-Path: <linux-arm-msm+bounces-98533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO0/ECfKumm6bwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:52:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D35562BEAAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E03BE321D3A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D030C3E3D98;
	Wed, 18 Mar 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4i2+/sO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZb8XITI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEA83A8FE7
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847683; cv=none; b=qTG9vC+zL8rYeSSdX0z82Cp6Jbcek/0ZYzAAecQE25vSwchHnOBHsv+UVOKXSpM6lNS2KiVgMMDcYpVH7uZ436OSSwtzqoxkfwQD7Tv3uW0nk+FrGIWSI0/Frqp8Ki2VzeHQ7or+0+LlB+GnSRlOFtsKS8vjHKOErF1ZvX1xLwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847683; c=relaxed/simple;
	bh=Cr/iDRTobwk2I183E+eXlJd5AIAsZSRE9UXnOhWu7WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cr0+goSF81AgG42XQjre+u8vReJEkiU0elBSrqGQ4sxuPsJsGNv8/8PuxSRNEqZMXf3UlbLoDNDSk0hLcUyftHZYneW11w4Sj04tFc4ceOmnG7alhNn7v+jU7fKlofgtBSpJUCuA2GSEIYnX5jdkgomUFsWldK7AASzsd6hrsn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4i2+/sO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZb8XITI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ICBdPl909516
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuJUlH4doDFzglyADiWfRYiggVG3riSGedoZ0slOE9A=; b=b4i2+/sOyneSXzlI
	SbDcJa6JwI9E58qKdPTugdR+7ZzeeozMq7Ot/lLirMtd85bwB6BXjdXOGpYxH6da
	NCThLMvUFOiqPtWqKcENON6oLOvwk0tl7cmau02J6p1U5ORzh9W/7xso6ko+S+nj
	2HauAjkg5TIg9u9WEiDSk8MKoAYG8nX1zO0bwBeJKwcQJTTATQyq7QcYUB9Ehr4t
	G+HA8CLNWLSMCVnxZ9mBpAklJjbRziGbO3ytQgm/Hpf0JmmIuXwiLpJqmtupDB7i
	A+a/2eMd3Zejj9L/NRG5+liW7UPPgYKlaUWy92iGxEwIgR62Xr6/tONozdqti3U5
	koaoKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyuucgqur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:27:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090bc4823cso202965031cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773847678; x=1774452478; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuJUlH4doDFzglyADiWfRYiggVG3riSGedoZ0slOE9A=;
        b=aZb8XITI0wEa7aA9ix0sPjd3Oq6eYBRhB7kOr75jMn00aeFPGXq5aMsVTLX4puI9Fh
         h4WYlo+rtNu+wq6efFa/zLCRcO1ciI1mfKGhvvYxqg/dlVRhnU4LdQmpm/a42uwQDDKh
         wLTfL0Ef3IVgtHRK5s/CSA8Pp9M44n69214VADeqhbE0EkQHsxaGyd0JZzLnFO8yrQNT
         hE3FQIviAyG0ZU9uWoCNm9Hq2yZr2jJsZfNz4uphPUHsqvd4lrxye8sjt5sc1B27f0YB
         nb6Z/phnYRX22eKalI+mhgyjS3+1MJTSZDygcYH6qIv3Hx2Ofi0N3eoLbohHrPVS7X7x
         cPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847678; x=1774452478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuJUlH4doDFzglyADiWfRYiggVG3riSGedoZ0slOE9A=;
        b=muFhF3Q0oUJOaZ+n+cy1MX+uCwt1QtOm0Xge+matWSdexehqzIHcMj+dpIi/S+bg7/
         CU/8IT5XrMZtTSQbDjEgcf9DVuoJi0lXtd3UpGuf7UShXKoc8XxaNjEmXLifbMO8rwVE
         XDzazIFIcJ3IWie2u0gHdD3NDrmn1Jui+AJzkNXPOYF0kd3xxSdxTVOb0UWNvwj8qqh0
         OuOGF9e3vBg1+Y0qQL5BsR5Y0QOSgfXh6qo3INjgZazDacsKgg8djit/1uzMe75sW0TG
         +E5RL7Shmlpz5VVMDgAq/9lScmoedhx6/nwuiv7tIzCCRzhGUThyvLhJ48hCLHAoC7na
         NBTw==
X-Forwarded-Encrypted: i=1; AJvYcCX9MyzItfOJYGTWvMHzpZc5cVeSUaXtHuezadJ9DbyGm9/PmQ5itgc9LVx07JiWWo96a4R9oUDyVzM5rT3I@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3LdnuKmlGv9nS614UT+4jHp4m62h/TWEIKTwFc1GEZ0F4diPQ
	ilH+V+1ZOyWPSyzY3zqzMF8zdrz5ZxmyRSNvAKQThbc6UfZOzaRUu4hJwyoa2nbnxHqDjk0EoC2
	nSX9tgBRrOUOgJLffjXd8vUBfiimJyFjp/EeDKB3WFQ+JTM95UtvZi3TLtyjKNhAO50Hs
X-Gm-Gg: ATEYQzwZ5lzNxMQSMMWiRCFLzJphnGyPj9nNRmMaoVVoOzuxA4xmAgMHnGrqhqDhG0V
	K3bxArZmy7MSx7Vm1kDK3SLPWd0TAlZLH88MUmVATd3MvEgFW549SGeT8TGSPirN3xCOf2ZSQfY
	0IAVTWDaaUrZVgWZJImq7sABPTxU7o0Yheq19yhVsZsvdRqxUv435SV8Lkv4pYi0wntMifv7FKA
	lZ9CSCiqPmVNZ/63Ya5n9y5gaxkq8Td73JbrH7u+96BwYQb/gRXtDibYij9EUbDWmL5Jz7u8WWs
	9Jn6mC+zmTgXUndPq23hab7ZfKqtsjK1TR0v9wKvqzdcpj6lvUDQuaA5a/sj6ziLoQjfzJRZ4+z
	48nD4uG+YqbhIvTVvXeAD/zqvuE6gNG7BOswbrCAIdNR3Xvr8SEIUfXJHLotz9XQ44v3OqBZ+MY
	GHorIus/DWV8zix3VlspFQmbgn5Qxu9mkFr/0=
X-Received: by 2002:ac8:7f41:0:b0:509:1cf9:ea0e with SMTP id d75a77b69052e-50b1485c934mr46201251cf.41.1773847677932;
        Wed, 18 Mar 2026 08:27:57 -0700 (PDT)
X-Received: by 2002:ac8:7f41:0:b0:509:1cf9:ea0e with SMTP id d75a77b69052e-50b1485c934mr46200801cf.41.1773847677443;
        Wed, 18 Mar 2026 08:27:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c6e195sm603363e87.47.2026.03.18.08.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:27:56 -0700 (PDT)
Date: Wed, 18 Mar 2026 17:27:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <ulenfus552ggobis4gmi7eh27tikdaxbgm2oj63b5l2vemlfxc@ib5f2xaqurj6>
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
 <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
X-Proofpoint-ORIG-GUID: wqkHWoDCCol68odRKqlrEzOV0qcaFuxj
X-Proofpoint-GUID: wqkHWoDCCol68odRKqlrEzOV0qcaFuxj
X-Authority-Analysis: v=2.4 cv=U4ifzOru c=1 sm=1 tr=0 ts=69bac47e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=u5M8gfWzTKoBtfYfDKwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfXz6vdFNCesi1U
 S6keD1wLtrSU+oNjhV9e9CYJaQy9ucJHRLAgaIWUq7X6lM/DuEOK0proIdK9qG0aCGYkR7MA/l4
 QFRqGyRy5NObrdV7ZyFF7FnZQOR03HZ9HRrVPtOWfzNEG6v0yW+lH0ArPQyyMPEzvPYBjX5xDSc
 XgvfonZ2QmZaL4mWL95xYCeFWHh2q6GUKr4JzvED8PLM2of469nQ16hJzE2rePuJfyF1MXeNnjg
 ZfDjaMFWvQ6O3e+AgTmGZiiwckm+8qJyzg+YxiWRFv6pAtfKk9siwVxLqS9LVmMV7gkrO7XU/tT
 ZBmksMXsWQY4+lYkXDdXxmKPVbpWiEHWPTNpX51XAM9FC4mTlMAKpgZHeMYZdim4eGpxnpdoXt7
 M3u4S9dFsFcDD2HZV/S0ewcpU0AnVI+PxK6lc4Xei0I8yPzsQR/owJEgmnXhdcqeU6jpq0suj+U
 +3R6l6LGav2yyZ2i2Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180132
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98533-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D35562BEAAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 04:07:39PM +0100, Neil Armstrong wrote:
> On 3/18/26 14:17, Bryan O'Donoghue wrote:
> > On 18/03/2026 10:15, Neil Armstrong wrote:
> > > > +    /*
> > > > +     * phy_configure_opts_mipi_dphy.lanes starts from zero to
> > > > +     * the maximum number of enabled lanes.
> > > > +     *
> > > > +     * TODO: add support for bitmask of enabled lanes and polarities
> > > > +     * of those lanes to the phy_configure_opts_mipi_dphy struct.
> > > > +     * For now take the polarities as zero and the position as fixed
> > > > +     * this is fine as no current upstream implementation maps otherwise.
> > > > +     */
> > > 
> > > This is wrong since you loose the lanes mapping defined in DT, which is still in CAMSS
> > > but is a PHY property. The lanes layout is not a property of the CSI controller,
> > > CSI controller only need to know the lanes count, and not the layout.
> > 
> > Lane layout is a PHY concern but, the PHY API gives us phy_configure_opts_mipi_dphy which should be extended to provide layout and polarity. This would then be of benefit to more than just qcom/camss.
> 
> Why ? the only concern between a controller and a PHY is the lane count to calculate the bandwidth, the actual pin layout is certainly not a controller concern.

I think that the DT should be providing the information about the
connection of the lanes and their number on the board. Then the CSI host
might want to limit this further for whatever reasons. But I don't think
that the properties of the lanes should be configurable between the
controller and the PHY.

> 
> > 
> > Right now none of the CAMSS users for this driver depend on any other mapping and I propose a separate series to fix phy_configure_opts_mipi_dphy rather than introduce data-lanes to DPHY.
> 
> None of the upstream users of camss.
> 
> The problem is even larger, as you replied in [1], the csiphy is still exposed as a media element from the CAMSS driver, this means this driver is not complete,
> it should be a media driver entirely with eventually an internal PHY aux driver, but this would be entirely implementation specific.
> 
> Either the PHY is standalone and the PHY consumer only calls phy_open/init/configure/power_on/power_off/exit, otherwise it's not a fully standaline PHY but a composite device like here.
> 
> I propose that you write a proper media driver for the qcom csiphy, which eventually spins a PHY driver as an aux device.

Why do you want a media driver? Isn't PHY driver enough?

-- 
With best wishes
Dmitry

