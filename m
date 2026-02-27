Return-Path: <linux-arm-msm+bounces-94445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLvrKhGMoWnouAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:20:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDF21B7039
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DD35302441A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D463B95FB;
	Fri, 27 Feb 2026 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnXlpHf0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUMznOiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A714326D73
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772194826; cv=none; b=jAnmHff3DU2yf8WOtLi7cvYorFUjw4VNn5TVD7PXp+/gq0u56IcfWl03GjHCPBA62rIrrPXpp6XW9+fjEGshzQRtsmJQDlDhHoDnhNHxzTyI8Jo2q3woZm3wHrkXyMh+eHFO4V5E+oofoQE73WfOH1PTKvLb4u/apVsyvU2c/yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772194826; c=relaxed/simple;
	bh=XY8tyEJMSUG0siOYxOKBdb99wfNyMK6W1/X6N+eG7LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgFk+Xy3XGDWb223CuSv13G+NxQEYhCo7RYn7AR+YXDNnYzpp7CH7DB2VSLbTDtr1ZqtdIVnStleTFsmkUbqipmkEMt8iWU4IcYdfrVYaaXarQjGUVLb5MTb4AW6eTxcuE3dAtP0sFPhMN6bB+WemVAs7g9fG+6I7JKjSmEcI/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnXlpHf0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUMznOiH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9m33i2403019
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qqsgJPaahabjOxXMpX3jt9uW
	d5AXucfkPodZFYdvoWI=; b=PnXlpHf0ZUVMqYOLfGGhpeT2suBU9GQTN/yuuu3t
	MU3BrQnwZS/v8gyU3OsmZBkxxBL/kt5XUGVuzFAbvWJOSt+Eu/8sL+rtlMg0omak
	2vV9Zcs/zZ/7Qc9mT0MAvSLgqVS7hRLO6N+5DzdrfNweGPGuNKox7GwgAcnWzKQz
	+xwFEbloBtc3hJopP67ZieOodU82swKrPm9siAggRT1S64rXthkYQE4l5rIvbcOU
	ZHrsiDFKrKPgNx/Q6klmqoz/M3cYOU32rC0BTYVeGom4/WNI0/FvDGP2DzPRSvDn
	bouMJm8L5/OrNpufRRHTN4IhwBoGb+2IIlpwfa2Ip3TxdQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw23apeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:20:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c711251ac5so1495320385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772194823; x=1772799623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qqsgJPaahabjOxXMpX3jt9uWd5AXucfkPodZFYdvoWI=;
        b=WUMznOiHXgz1whfJg5sNegRdD6Ca7Nr+q2/FhrTnqLy3Sw27i0kGsTqptP88+58gCt
         59gw4QnDlNpWR+QY08YdNxAIoUYHP3XQ6peZzfIVWOPiUYSut6g0GneFYczltNiyhEC9
         lry+QYR1d+bkgqUVMpZhKJYSt2vHe9/6GuQOjvb5Wu6SJyz8X3gmt/FrRbsGWlX3M9Dt
         QBPE4C9p6mpLjTxwuSwlsjNd8k0rQ7CenQCyA/48B+gOr2IfOO47l9mKYUFoB9VSvUyL
         k8Ymwpvto23SZc00s8cpe3hGOzp2ZhloytNEoaypq/J2XdNoolMoz5iLSmE0weLIk+PS
         K6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772194823; x=1772799623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqsgJPaahabjOxXMpX3jt9uWd5AXucfkPodZFYdvoWI=;
        b=CQCASup/BudNsG6A+rVSpXRGaxqdg8Wlkmpxi547C+CDTeCyw6a5dFIN82pPZnEZUN
         8nTDjJVhZpWPdp/KwSgI1tu/8oKqLLQYmaZegFh+nctV0EilZWgAXmb+zU5Vzqze7ZEJ
         99U1DOEWDs/tsdalaUvZGuf8Fxv68lBESIilKUN4k+FwJTYzNs+Em4epMAb2c/+mGMUl
         5Xuw3dUSUGw96sI5g0E6NluS5C2u3dWVsSTYTrzQfErdR69XsGoA7rdWfwlhLGazm1QB
         cRKVwtALhybhRpJ8gdfyvPsAd+14vdaQts8U0VKKZHSPbnwPUj17YIzg6scT0bKZP6b8
         L93Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/zEXm/lflGRzzJFeHrDH+lpNTWqt5d4BgwanidhIMOCpvr07ea+O42iyO/EPFWvHyiUNiilRYZSG3cC66@vger.kernel.org
X-Gm-Message-State: AOJu0YwOmQkHDfqpTVxCfENR1W+3ZdsHODjDd27brjCOuXeOPxXVRm51
	Jdj5RLyziOvd03EEDAefIHuE9FGvB6hvbVE+vFjiaBEIZgHJEo2R8GM0FwvULZ+kGcHQ8y3iZhH
	k8MoDQuOzmP0Zazt9lIPaN+g2wXcUyHWRNnVBBu3KL7drjVQ5KAoP7O7mTAl40LPBL2wWXYk4s4
	2A
X-Gm-Gg: ATEYQzwAzItNg60Uv6TDMD/uATet7sJd8IolFuDAtnMPH92HzL8j3VoikLwe2XKsrQY
	84VrxbJEfi7iJaP6wbM6K25zofBqUgwTh0avZTTd+LydH6mUj4ZIrpyF59kgp0QCXyYRexL0n1U
	bNNVG0ayQp02w9U0Db3Ntv0s7ViZ1WDoP5LNk5PEOctyVm7M6+N3GVH11zLDhWZn/IjPuhCWD1w
	+8xd8B2a8tEQ1r502zY7D0NLMGR9R+Y1yzyGqbA1cQWx0Dyu6VAmCPvoiuyCC8f9hLTV4hzHekh
	05BdyytYSLLBWr7DjBMJ7QOmO/t4lvXCki932u0ze8zag0lmktDDKsw8vldoi/TM3h/MgykgHWB
	a0UOK2bSKqSdKVievakIN2hReKQhIwqESPuU1srO3xbM2DIAI5HsLgo3TGdht7MOi5/R8AuA=
X-Received: by 2002:a05:620a:3952:b0:8c9:f8e5:9f0d with SMTP id af79cd13be357-8cbc8d9f948mr304296685a.32.1772194823038;
        Fri, 27 Feb 2026 04:20:23 -0800 (PST)
X-Received: by 2002:a05:620a:3952:b0:8c9:f8e5:9f0d with SMTP id af79cd13be357-8cbc8d9f948mr304292285a.32.1772194822474;
        Fri, 27 Feb 2026 04:20:22 -0800 (PST)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109df86bfsm1796981e87.61.2026.02.27.04.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 04:20:21 -0800 (PST)
Date: Fri, 27 Feb 2026 14:20:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Zijun Hu <zijun_hu@icloud.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable bluetooth
Message-ID: <c33hbvbde72cmls7zi44wj46dlvwflvul7ukreywd67izhwp5g@owuhd3kuwz4i>
References: <20260226-bt_glymur-v1-1-838fcbfaa767@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-bt_glymur-v1-1-838fcbfaa767@oss.qualcomm.com>
X-Proofpoint-GUID: A62qmqAls1ZzPNmFJWOUzc2Q1P94epxR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEwNyBTYWx0ZWRfX8TVMHmLcvN8P
 HlVfRYtJda8ssKCkeymXJaCn3rUwcOSDlRAR0m8w4P/u10HQaD49PtgDpbrK9MYIKWv9zJPaGzD
 WXoqjEnyWyMGZrLdpgMDoTGZNrL/dLQ2lPD/Ka7snHzfTVO3gSqlECZ+9UlOTdAJI3Xwfaz44F7
 jubkLYHeWusGaZeI8/M+Xm5w2w4uDWWjYqq9PfiNk47HdE5sSOg8+SW53UC0oGPAp9JLogAlQw7
 7zeuvv2sWyaDcsKyCwxxxLs0XHUr0RVIZr32c+lwehkvD4AkRx1zWBD/BvvcfFSiqhkWCGqB0rc
 PfjD7mcbc+3pp/QHHFxuWptl+iKAiCh2+W0QsLlCLAOH0MaNzsoTT1NK+YSD9viz/xpMtxwHpae
 XSa3P9KyOJS+zGzJRWHCKHKefmSa298qpho3J2htSh3CCYN/QmakDxtth+gEDRbbwsLS4KlFWEQ
 9ST5O6Zex521zPBKYHw==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a18c08 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IaKb_ughYWkuG1P8dkoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: A62qmqAls1ZzPNmFJWOUzc2Q1P94epxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FREEMAIL_CC(0.00)[kernel.org,icloud.com,vger.kernel.org];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,oss.qualcomm.com:server fail,sin.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94445-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BEDF21B7039
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 09:31:16PM -0800, Zijun Hu wrote:
> Enable bluetooth WCN785x on Glymur CRD.

Please enable the WiFi part too. They are two parts of the same chip.

> 
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 85 +++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)

-- 
With best wishes
Dmitry

