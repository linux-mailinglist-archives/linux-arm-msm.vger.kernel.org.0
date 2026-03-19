Return-Path: <linux-arm-msm+bounces-98819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAv3LfdTvGkXwwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:52:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E3F2D1D0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE1A7307A3F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3435534C81F;
	Thu, 19 Mar 2026 19:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eROLAxOS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRAnoii2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E332248B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773949941; cv=none; b=SktEWNwDpxnklRMK0RwdfAjK7NcRqOgd+Kw47J0Q+SnZf/2OqzaGHTX4ZmApgLsYYbvEQk8IZXTYlY2eHULUZX2s+/foFYl6htXK6RSchDWdtF3s96h2yJZO/onfrwbwBS/iyycCU0PnzAy42a9TpAeWbIEviqpKAJS1I1EdFKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773949941; c=relaxed/simple;
	bh=/rr5uxNR96xN/b7jreNzYG8HOZ8gvoDkSdRvYMtUX8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3f3c/vByILq8mvmT+uz+mXEKn/wa92pUiu4WerP8Ywjy+nod13n9N1oMfAV6QVVESfsyPw/mOIJtDeBpeAmba/qlK3pBrJM+hdmUo1HRWzDu+9IvE4rpNCvgRopDqA0LnNjPaO5YFrU6VWrEudmelipNvKEtJbnOR/CBUjSp5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eROLAxOS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRAnoii2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JEXNaH3648194
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2mZNokb2an57NRYIhXcZ0iiY
	bPweTbX43pltA8F5UCg=; b=eROLAxOSGD+fO2dgCm2jOSXirhejiBhhLzpZ/8Wh
	cgjoLRJlEp1cyrDK1AP6b54Mn0qmETjC65wQwerWKfs4Hx+lgt32qd2jOoQTIjp3
	q/Fb9ivydyt3m+3mguYCGRha8ph9QqJxFj0VmmCr5eBCkATqfVN5dEoqnZ239Fjl
	NjI+BBhIxmAcK8ByXaZ/wQazE6KpGsxXTFvpwmAlFAvA3vMCVl1niCKBIZKqBeA7
	XiRbY1ObmCYNJoWqdhpOxRN/dAYrOwCUvskwXdtH7ePeX5PXIScJH0nrlQdXST9z
	BFnnxfr0nuPtdb4EAhd+oT98zwnLdF5Uqj0HC6EWAzCDOQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k0v93nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:52:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso6637851cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773949938; x=1774554738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2mZNokb2an57NRYIhXcZ0iiYbPweTbX43pltA8F5UCg=;
        b=MRAnoii2vnWtjTuSjl2SYOKQrU6q7F0/0X/5MVMjPb5uK8NhAZqthgWgvXZe3Cajel
         dQNeErvoMZEsTe8FhcmPJhvpFCLGTURv539/WFZkEXoCcuARyfrG5xCZUDfGB4/l8wWa
         6o9a731beNQNbUP3m8s6sZdHADK5p9iGXBgLvxXAEo3Ty6ZSIe/Zz4MJEzsf8H0yC8No
         1c+eKVpLTOE2hmyMmKlHBUzIWz8RA7P7TznCy8Yj5Z2PphLn2J3+uDqmhTfUG7brzG3M
         mAffDoNoeZ+UW9CoBxUV4hD8vpPZhaHFGj1LtrIrNww9wpFgz8VmIayopx99ty/1IdCi
         9c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773949938; x=1774554738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mZNokb2an57NRYIhXcZ0iiYbPweTbX43pltA8F5UCg=;
        b=rrG0wJ64xQ+zAjU2B3ymoQpYU+lB69fi/PIIUTEvpPwOzweWhEDYhWT51LU3ukcO3y
         LyglW18KpyckSwgn6bOK7fN/HNZ9b/mmtfNivMvIUE6K3aS8jZenJw8q9jlHjjp+phW8
         Zaqh0qpCjTDXzz/EZj8DVN0wJotsgWYor1Y7ErVnMZh5ekuPemy5xCwaCI6cNAxsjfgo
         +9eFVnWTuzosbDuMINpl/w3VNzSp11oKkPGziCBUuA+oMKQukMFSxeoEjNABIoGeBZaM
         D0iOjtLSKTnaulqfcpOKFjdyXc7EqDp/b2kiQGWpAj4N00MYvG4UhhdNgdhg6VFh9zLK
         MF5w==
X-Forwarded-Encrypted: i=1; AJvYcCXd8zqBkHvWoDf8FOOR+tU5pzO8axDOsLCwqU9+XfC8Ulpeg+KqYwBnn5Cuvcipck9dhMhKfRNT7Cj9KSIU@vger.kernel.org
X-Gm-Message-State: AOJu0YyWnZN/WXD4eiW5ZacStZSI4j6rea35SEZuLGrecIwXIqHXHBGV
	QpYs2hTJgR77pC/BLi+EUjRclk7ogHXE3K/aAk+ubdKVUDMhHuliTQlPzZZXdZ8QS7Tf3JChBgI
	Hk1tuKC889f4H95XIAUDZPJc/emtzcvfliOHoIW/ZJ7bCZBJ+t8sESZHwFI5pJq3kVXnA
X-Gm-Gg: ATEYQzx20er+BCUwpdNx/ZHFmVJaa+/m1Zs0AOw8cuweY1LaRJVQQMtNwnhbY5fYXTl
	rocDYbjW4m1PD5LFnvwR/pTOeTvqR+FSkcuHXlxQRgBnrKM/rdNvKT8OecYUsrm4WKedliyI61U
	bucyoDKgpX2tCEEVCoSKsJypMmQ+nltJPKLswsCcyKltDSHKAW18vJNLvq98Qm1XOawPEDCkSph
	Ak5K8i54pZ0gdidTHV49wk/eqbwlYAIBC41K0EbFG9VFRBCdOI0q9S8PjAqwBfAR+fxh/S4j2eY
	EYD/Tl8nLKACdCFaTaKivxd/kGyhWcfnyi4Gyx1BKPrIWxtqVm9ORcFk2CP3E3UGeScK/ExdJMS
	pi69PpmkUd53Nfel+3GaNjqXoSPDTMS4tfib5p4juNjB/NLmfyBrzbLDO6FCMsPlVBQXbLGpZ46
	COy9QHxPY1BAtGoSMGfMq01flMrD+Ykf1rBzo=
X-Received: by 2002:a05:622a:164b:b0:50b:35de:c4db with SMTP id d75a77b69052e-50b375667e1mr7561911cf.58.1773949938087;
        Thu, 19 Mar 2026 12:52:18 -0700 (PDT)
X-Received: by 2002:a05:622a:164b:b0:50b:35de:c4db with SMTP id d75a77b69052e-50b375667e1mr7561491cf.58.1773949937519;
        Thu, 19 Mar 2026 12:52:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305eefsm95187e87.70.2026.03.19.12.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:52:16 -0700 (PDT)
Date: Thu, 19 Mar 2026 21:52:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: glymur-crd: Enable eDP display
 support
Message-ID: <icgmzx6tedq3wl5jmadwzhfmm3sxzdf7n3dc4br6dljezdombd@ssz5gvj5corj>
References: <20260319-dts-qcom-glymur-crd-add-edp-v6-0-f582e87ec874@oss.qualcomm.com>
 <20260319-dts-qcom-glymur-crd-add-edp-v6-2-f582e87ec874@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-dts-qcom-glymur-crd-add-edp-v6-2-f582e87ec874@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OrRmz7NGd7R-5PFMrkk733jbCvWDtVL5
X-Authority-Analysis: v=2.4 cv=EcjFgfmC c=1 sm=1 tr=0 ts=69bc53f2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=z62f1IN2GlXO1xLWDYMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OrRmz7NGd7R-5PFMrkk733jbCvWDtVL5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE1OSBTYWx0ZWRfX1ldymGfZlRo6
 9hFj1RqOzUiXNiP4S3FAG7IIBlLldE2BcqDO37y6cunZj19nOKWrVj/xYLhoox2ZJGD+nIcK6ol
 yXiI6yZh9BHq+SqDpovjZ51Amu/VnfvdvnJ/WpNyZej5JxX935g88vNVbelQUY1drsL3bv5Rdry
 S/p/2AQbE0Kv9SzTcPza/Gcvh7NLpgmAl1JKh/tyinzN8AwAuOkY/PMzZxEey2FvfnPwYEXZVhJ
 XhGAJtWWGKN9ICn0S4PjFTL6dZ8HOX2Sssd8tjZlgrpstllLTygNPyihH5vbT1LefisiJdgZLxb
 iPfUKAM+579JXsNqqRSd2W3Q7N7kF4g3B6oZgNG+zfpWx9Sg/d/6QzbE/eB/yRLt2lFiVIpxr60
 5Ku7/teGha/3Bv5ZuPZpxXAuLXpqvaR3IhaX/ZfdoNUsONtFOYvpDFniTTbxWAix6sE+H0nv2D7
 LiX+K1jC1zNAH8W9tVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190159
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
	TAGGED_FROM(0.00)[bounces-98819-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22E3F2D1D0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:15:15PM +0200, Abel Vesa wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> Enable the MDSS (Mobile Display SubSystem), the third DisplayPort
> controller, and its PHY to drive the onboard eDP panel on the Glymur
> CRD platform. Also describe the regulator supplying panel power.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 71 +++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

