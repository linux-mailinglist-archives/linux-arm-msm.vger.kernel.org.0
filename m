Return-Path: <linux-arm-msm+bounces-99464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJZDA4bZwWmJXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:23:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CEB2FFA0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B511A305B97D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D0242050;
	Tue, 24 Mar 2026 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cko+SQ19";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pmq9nEBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2634EEBB
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311295; cv=none; b=JHayLiOiF9fw88X86adus0Ffwfhi0blOI65nZdcqmEsYh+DuXQ0iN/oga7UG8MoRoaK4J/ViZDenRx7f11/0zlw4jsMDZocSXSbgFRh/NSZwr1qb9qxC1Vk11D53v/B7htfwCjdmhQvxZNa7xHgtzCywUHNKWiB8vMdXW2nhvNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311295; c=relaxed/simple;
	bh=9j09q0k3NPk/W0D1Mv7Z4HyOO1Fb7jqm4O93lRXLmOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXzaHCPMaCEpeMb/Q9vhVnDOZUOv+eaHcyEtrRoE8aINRncutTnZfuxa5RHw0Oy1KcjYkrK/uBBUXi1gpattWirIN6uMSqYjh1qHYl1UdXNoxSXSwkp98V0S+J36IuMOiNy3BmfcQoqsY5d2Y13mUrB2BmWDrYF6qONCeh4ncEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cko+SQ19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pmq9nEBT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXM63170664
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J3sy8D6eHBM8dtQyfghIUFTJ
	5QTZQVrPaBV+09pQxmY=; b=Cko+SQ19I5/wdL89clpobSqb2dQW6xAwzc4RuNCp
	Sd2/vDqK9nVwOvxTeUeE4zxT/yHWYk5c0CpPh4WtwWda2QsY200/u6tR5uDjF8pk
	4hTeuR1qnwC/A4FTT9da03HsoNRe5daokCn9CzEShUPYnWSGmSfVjKJH8jE5t5JO
	7YIXWypJr35ZsBE7L7/qEAMPDC0mdlmsUmtZp8x/NM+voIl+b6mMW0UmeT/2CNaZ
	2ESeYdx4K/FupUO1FLhMNAr1jZhqJM+loyQAO5npILweTh+iKl7T+NhUCNHLZksd
	vXsJgtTKHEDHrcq1W/pHcWMjQ3oj7fXwS5EacLs3oisOPA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r2275p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:14:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b317c40acso53693111cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311293; x=1774916093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J3sy8D6eHBM8dtQyfghIUFTJ5QTZQVrPaBV+09pQxmY=;
        b=Pmq9nEBTU4L/NMuo/uWeRPRNMx/14YBJvi32JhbyTwea0k9DhoiKgIbEelepyXvlkl
         +fdcrZ9nm4JvkPd4KoBDaz4uRglQSH2/vUnbSr5RBS73eM0Oz/LQv/oYjkyGEqN4Q2DO
         gu2TVM1+A9wwolr/F991KLpVEpIgiggDgX1vCDcRuwWC7mD0HledjV7FK0q3LHlavTd9
         AV2Bc/sAvsx7vJdausFIohowFvVBzyI4iJhdK2HykJZ/LH78a2bPyy6tEFsDgIF5xdFF
         Y702u8eBy493yVivaiPGCixS6cWO/fc3IsKEXTz44H7tCX94ZVRLg7yJ71u98NXYCUwK
         0z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311293; x=1774916093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3sy8D6eHBM8dtQyfghIUFTJ5QTZQVrPaBV+09pQxmY=;
        b=GAASl2ziRliS+D8vH2dp0YjL4lAcgbwlcTYUYfjlQe0FGf1FlTIBRfCtsKG0ofQIUv
         lSj008fo4Ctvri1dfwoVD726Xgb2m/7SXIBZWerQAqi57Jr7ZxUf9qaiBjZGD+/dcleZ
         CpGq+pxRuuJhIlrniU3EpqrGJitYvOMPSsYKMmBJK2itP1UGKYzzQmf9HZY6QSKc9Q1Z
         DE2OUCKKR7fzo07Gv3e294Pqr/pYMUnbd+gh6TCnVLORdpAYKPs2aJSiNs3nT9UPGyoU
         Ar130Sdzy7rxugHfFL0pTtp6KjOsnv3VNy1D6W3ZgFcJKcbBD9HuJcFK9wD2exJ0pJXX
         G/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgQWQSX3iJ+0lK1PlSeQzRRCnXUkzhGgixzlG4MqbPAOjYQ6APFffevEFe6f0lt1jA0aAL5QjZ2yzeibuj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4DCnTS3K/YyoeYk68+we1y9IHJm69xLJRhpGQPwOae1wqc2Ds
	RDJxjhbVNNQVMbGWtrcAqNsIoWD8UnIbnOESGywSbSU5AS+SjsODd0CbnaL98mdTirpzmgvQKap
	F72tKbfMhInRI44XYQ5HpkyJcwntCbH+dCtjZ1bjkTNgzk7eKdchIWuCeEOtiOsoA/Q62
X-Gm-Gg: ATEYQzw4QuC9V6Yjzw5CQUTdrl9zhMhKP1qjOeZWpxIY5m8OqrAPQd7yvInpCKBWNvb
	1wTyFpb0ULlBbePgHwhrsHHj28QAMycapPrVB14Z/tBNgjyrpq9Q8cHIU7JryS67jp6pKjR7eEe
	Am87fhsaeQpiB/EQLeLzivbWdie53beOx0NwnhejGVLX4cQ2e1nm/qSmE365iJteNljYLjbRN3m
	AJad6AX8E1UkRFfwoxeJbdkOcbRiW+0PONdqIyvNQVVsh9r9X/HLDIuyH+GqB0Js0uSi3PjpM+W
	K6RGD1HUZQuex0hLVZrXacnRyshawp5qToV+hZ+p/F7Mp9KY2Osd8TorioXETNzTDBI2Rj1L6Lc
	HGXEjWVT4Geai9hJsLH6M26YRy7Dju44rdvuhgDf2Vn1cI/Sz1vJ+9l7uuZzHLtyr0wW4RXD65T
	7zanr3jUJ5YWFK0PI4u69wtArARkUXUsFKVaI=
X-Received: by 2002:ac8:5f54:0:b0:50b:3f50:16c with SMTP id d75a77b69052e-50b3f501f48mr198988101cf.15.1774311293081;
        Mon, 23 Mar 2026 17:14:53 -0700 (PDT)
X-Received: by 2002:ac8:5f54:0:b0:50b:3f50:16c with SMTP id d75a77b69052e-50b3f501f48mr198987811cf.15.1774311292577;
        Mon, 23 Mar 2026 17:14:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aac6f5sm28265831fa.33.2026.03.23.17.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:14:49 -0700 (PDT)
Date: Tue, 24 Mar 2026 02:14:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Add LPASS I2S2 pinctrl
 definitions
Message-ID: <xxh5wwzte4ccqc3tcsokx2oaj5vv4jz2mvvop77w56olae455y@cq6ddiifnk3k>
References: <20260323095247.92890-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323095247.92890-1-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1d77d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Z3ui5y-J4bSPkrMtwxMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: s6pJ-RYultTInbZDBnhHDTl7lBktEEox
X-Proofpoint-ORIG-GUID: s6pJ-RYultTInbZDBnhHDTl7lBktEEox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfXwKvgzr5VweIl
 YikOgTdKOrSRwAKh1QTX+yCd+vW0kcFi+qS/gCabh1IUnc37Fgijvr+IzyEhcnCkpJMKVt9MyRY
 /nCUVtnQxs9dux6VOuF1Z+ItDXUa+1epX2/ttagLOBQy5tjqVp1Pwg/1kQfPOzDIDDqkcvUG/Ya
 jf8davTIamEh3OOKvfBu+ERYUzM1rPK7NlJtoGR2atFfxDDzIjVXK5A03i9yZtTdRN9Efz4MhDH
 dYptDHLOAXwI/DdBBKmBEhfYSgNz9J3j+IPqP3c3eTnPJIJj/gu31BUc0gjg708Ove2THGDS8U2
 Qt2OkCUkpO+g4F5YLNhFrrnzxuZRwVyh3LKgktZh6NjO0tAjhTC7Q1wgdcBboPLKX96uLmg+3Lj
 BLNfOXviRmM6hCzwKEkiDItr6jhvtRiznTolsmc0JYwHXXdcjbSt2kh/cski2hDZyo/Qw7Vm7rq
 GWBK1zousdobYrqrfNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240000
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
	TAGGED_FROM(0.00)[bounces-99464-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64CEB2FFA0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 06:40:47AM -0300, Val Packett wrote:
> Add the pinctrl definitions to configure gpio10-gpio13 of the lpass_tlmm
> for I2S output.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> Similar to ff9c117c32bc6ace7 which just landed, this is for the other MI2S
> interface on there. It is the Senary MI2S, so actually using it requires
> the series from [1] and then more changes on top, but I have sound working
> on my device with it, so let's get this DT chunk in first / at the same time
> as the other prereqs land as well.
> 
> [1]: https://lore.kernel.org/all/20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com/
> 
> Thanks,
> ~val
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

