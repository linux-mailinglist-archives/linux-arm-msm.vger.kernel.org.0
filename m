Return-Path: <linux-arm-msm+bounces-108075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLI9EYEgCmrkwwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 22:09:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B730563B31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 22:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E4F9301AF7F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1A03043C8;
	Sun, 17 May 2026 20:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6id0z7K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QzL5hEqg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76C030C153
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779048558; cv=none; b=pydQkd3JgTaBiK7RGOqpp1hpRNgTP99UCMgxJzgy0rSTjupyLpjLmmoeoN9bw743rwLlliiaO5XDTIcjt163ITw3ewuAjPJrCAai29QgaxXLAI8b9u/7poMAMG6afSSYq0ItRPr0k9kQZz9w9BixntMBKZfL4+XbfSzz3qQsiJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779048558; c=relaxed/simple;
	bh=i9gGQrBw8v0uvLDFMNri/IPMVmw/afxZ89giSkJ3hUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3m7hxEc7ciVrr/b/BV7pBHTLKna4GCVAaapjRBQ4UuNXLUil+n8waQEhX4TuV2KiG1rmIqM8gZEzxF3hXhZB+FaUMAUYFzhG74cOESIQRH6WByd7ixuiBWL7LRqKs2mZD2+WORTunAODTMJWCWBAG7DgdbtH28pLX6yYXAhBnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6id0z7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QzL5hEqg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HJvLpS139523
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hu1EtnfuPuyZsalbXIEwU6Sg
	KVDqPybT0/jZrzd+yqo=; b=f6id0z7KZGH3WkQPvazB7wd+5zTpVArx8O1+9WXk
	sWySwj2F4MqGnH2ul3ouDVMqqh6gNoxCs/pwXNC5OOFvOTFyjWaLoMeGJPCQN9DD
	ceoQOX0tviM6RnhNZJdZO9ZsxI1DDTA6rsPcTuUN/8qVjJXbY63gDTsWjh+xqzQC
	4yEetI+yr026lerXb314VaMHpShyDmdzX1JltSedfjTnIXXkPb5+uEh3Jmjklrj3
	5s+cGQenGba+Zhrmse0IZ4vvL5ROvZyA12xQ0sOtnbJUNjzHvJhQLbfCitSSraqi
	1LOXm7S2RZB2gYQEToxa6VenKDlGM1tu3x2wCRkZt4C6bQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqugb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:09:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e8c47a3so51360121cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779048555; x=1779653355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hu1EtnfuPuyZsalbXIEwU6SgKVDqPybT0/jZrzd+yqo=;
        b=QzL5hEqgFZTm0ti0lTKnsU2GaRNCe/x9W5Mn3FAitpw5co9GWpRPBMFIKy+G6SpiK/
         QI5DibGKrR4cJT1KE7LixoymjlbnbqYtDqnXeU/BE+Nhf5cbP9B7tX7qPO2BXcNyAJMM
         Ie7rV02RuLkdsql2d7M4/dWnMcrZB2IKzXk6vV8Oseldvf5woxJOyLuu9xIfjEfvUtxc
         fInX+heJGRpRweBPjeZLe7YaylThpM6ngdI3Epo3yQx4xwgTJ5LZmTb9fpvpZ0nop0oY
         byr7POqQRYexD0ilwmIyQPPCOtOGhjOfgfBnCWvOA2LS3bp2x3SVhxTgtmoqfIw27WGf
         ZrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779048555; x=1779653355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hu1EtnfuPuyZsalbXIEwU6SgKVDqPybT0/jZrzd+yqo=;
        b=E4OJpgddBQcoSACeyCqFQ/iBneeLKe6DZbI2ZN8O92tTIg+Uz3MKhRWeN0Od0ijiyY
         MrQN0ugT1C8cJyNSvhHE0l5La57lr0HBZTAUJq7Oua2+68ZXCl3PjwCpPFVBnBBySTCh
         y08z04TmtBp6mLiDSQnPAOgrvsUHAv64wq1dqWOgqkg6QYMYfqJS1QiMb9lnVqbiF5so
         kJejlN/WeXpC4xRvaRsT0u2qpWbIvq6yB+sGtrdYcOJ3/c8tqRk274364znanL2GqwzT
         nsQh2xluepQr8pKrRPlvK2Nj1QsUAxt6Y/wGumCcQlSTPR2VKjwM0hSMs5o90v1/E4yp
         oyjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8S1VXtM3bm1Ez8XgRg5EAV6afW6JFYlJg4FBhZdMLPDNlUZyW4hDj/AzyeLFofX7JyaULvIoj3UIkffRaf@vger.kernel.org
X-Gm-Message-State: AOJu0YzAKCVAoZP01xPo7GbWDY8mHAX2C88DDnlLUhNWG4vODYLGIipN
	yUurW6MPRo4IFKLkhbuOfGOae4FVHFj3eNBU0pV9O8tZFp4vq0zue4Hn7Q0vvsrE8EaP0j7kxKC
	TtefIw85gGG1dMwc8HfwHVTqq7zBQjQZAbHBko/xUBSz9s233njdMjEqWwt/0w9BJvgI1
X-Gm-Gg: Acq92OH9vpd9Hclj7PepoDgDthfUSmzlQB8xHmICcy8NuYX1rYWiWv1g7BCkq4/19yQ
	aEozIB66oMCtW0dy//CnDQTe3X/FcwAdikTWlTf7Xrx6QXb8tsWc0XZIikqhP6MkaX/KV+rAJtN
	QEBeOGw4bBI69psPep3rBtgf/8JfIBkbbCXxeMGxBwsnY1HFz9K1ZpcTJ/bcRgrhy5gWbZwQrsL
	fDG89eDHM45cUgiHsH+27t5eVYmcutJe84Hxl7uHyZX3k+kFricU7sPn4/WHSIBIzbaZ6Bec09R
	p1yqIAnr5JjKDksSWsCHgU1EN5m8iyryKeCbw7NptcIiIWAzFDhsdACklgZ61Oe/vmDCA0ibgag
	Yfb9SU4PVDVcROBB3CbzrBGpI14XE/A9x4iJwuyUKtx8t4m5M8Hzse9hCuSGcedhaF2ZNuyQPif
	jsk9fqlU7xgWdTD9+w5D7G6YcRNCEduxLLcUo=
X-Received: by 2002:a05:622a:4a:b0:510:12d0:3d80 with SMTP id d75a77b69052e-51659fd7d56mr193596701cf.12.1779048554750;
        Sun, 17 May 2026 13:09:14 -0700 (PDT)
X-Received: by 2002:a05:622a:4a:b0:510:12d0:3d80 with SMTP id d75a77b69052e-51659fd7d56mr193596391cf.12.1779048554324;
        Sun, 17 May 2026 13:09:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164ccd7dsm2895550e87.67.2026.05.17.13.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:09:12 -0700 (PDT)
Date: Sun, 17 May 2026 23:09:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: qcom,qusb2: Document ipq5210
 compatible
Message-ID: <uoi2732geiiyocjkftdyf23hmbgsm4r5aroudoc24ja4xios5e@fwpmhz3p6rnu>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
 <20260515-usb2phy-v1-1-5f8338d466bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-usb2phy-v1-1-5f8338d466bf@oss.qualcomm.com>
X-Proofpoint-GUID: mbbLVGNZFyQBC_HJ9PD4_jg-5KeFqQlm
X-Proofpoint-ORIG-GUID: mbbLVGNZFyQBC_HJ9PD4_jg-5KeFqQlm
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0a206b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=11pfgTztydWGfUAPEyoA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIxNyBTYWx0ZWRfX3WnNJB++1eJe
 ef9+NbL9avHTpbdQqFjn75Z+9MsB7hLddCDox1a7PgIQF8fbAi4lB73Uaqiyp2rEOJ6B+nP6wQA
 H8hGgH3ddJfPSsZQcraYwRERbGmDvvzLY7RVp2derrF40g1CrmOSam5z6czMCbMUGaxd2zRDw/A
 I/xU/IGhe8INSfMvXr6UzeZTgi5qwTV+Tf59AYxwnkdCxEChUYCXd3EOimlrjxSIdy3KqWQEfa8
 RuEutbU4Sf77dvgny70BCwQBEPlrHYkifO7hvHOR6Xqtt6fCkBm5+Tq3JVcOk3X07NUBldPIBn5
 AdZUT8flDq9cdwBWom3hz46gJhl3NsiwL7w7CI0BfGIeeFq3ec3usmK/MWmG5R3mqnYeT4gAnj/
 YGUsA9M1zUCTLZM3XDtRGGydTHKVUmpfbAzS63NF6GNtgmWzjHqgOkVO74Krt5sV4Kvtd6kzh84
 dklvM3v3YVz1GU0UkNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170217
X-Rspamd-Queue-Id: 9B730563B31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108075-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:17:42PM +0530, Varadarajan Narayanan wrote:
> Document the compatible string used for the qusb2 phy in ipq5210.

Tell us something that isn't a part of the patch. Why do we need a
separate compatible for IPQ5210? Is it compatible with any other
platform?

> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 39851ba9de43..509cadd31adf 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - qcom,ipq5210-qusb2-phy
>                - qcom,ipq5424-qusb2-phy
>                - qcom,ipq6018-qusb2-phy
>                - qcom,ipq8074-qusb2-phy
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

