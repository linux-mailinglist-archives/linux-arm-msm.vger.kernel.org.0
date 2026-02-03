Return-Path: <linux-arm-msm+bounces-91675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBBQF6bsgWkFMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:40:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB185D91E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFDB53052EAD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 12:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68403446B3;
	Tue,  3 Feb 2026 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8UYK0aH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/55p1Rv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5E233DEFC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122403; cv=none; b=K11iDa3naRqF1U+iigLAgETCE6RG7ZppSNsVdVn4JqYlJrP0C3FFwrtQODb6e07SbMHbUH1S4FfTQEz4PtOpt0N2F5zaKBk05nP5pWa1VS5kqbAHZRzsKDVWIroHLju+AiaAb5jO4TwjjfaZdSe/DFHlKdXraw9g5biK4EF+cdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122403; c=relaxed/simple;
	bh=83yjvih4j4UOictC6ahgoIhRDOa2P/J0oz7lHYxnhb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJVqO/doaIUAhwP9ATOxovhQ4wKh7KsK1YG8wNviM8VNKM3K3LlOx2YSHl6/vOxWQaBJ908/FFoSom7oaZx85ldXh/QytTjRQzGiawcNLK2WPaZfNH5SqlC8LIErjxxZqfu9WhWR4gzkoovyOesGfNni/mmEK/ziNBY3sPnij7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8UYK0aH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/55p1Rv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137WH3r255010
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 12:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ufTr7+wzZ2/b+1pjL/6eFzV9
	KL+yNiviwWGyOeRQjGU=; b=M8UYK0aHetEUsxaG2LKBeqrC86ZIxw86xY0exxR1
	MmQSCmtaJnsc2+0l7c9AqteOJkcg5TTdN0TuKWZCWn1h+9a3zazZ01IPJQ3y8W/a
	mhiK4XEYLr61lGwCE+ML+OOwHGN/cpVKOovI8VQneXxeOlGerMvq6iiKyF1LOOZG
	MZO+KrgK0guLWIboSrECV3GDPLdhToXpe0vLb3zCnXsyv88BIbaysXmqm8VH1ILt
	Lg76EyAKw0Czm9ROfXSd5m4yc103QuFS5vDKSZ98E6MLAyxwZ7M2KBUe01YSCTVk
	ia8jcQ7PuX52Tw9EEInwOhv8i0Lm5j5L6wwXeZTe2u8AhA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0km2kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 12:40:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a87029b6so1668125985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770122401; x=1770727201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ufTr7+wzZ2/b+1pjL/6eFzV9KL+yNiviwWGyOeRQjGU=;
        b=d/55p1Rvruo4yRuPE80pHxcEXSLWiLsll/8QxBxReSOXHFsJAHj8R7t/CxlopnO0zf
         AVZbsZgh6AEQZsHjUe/TOI7GcocrJwn7UevGO10jJxKKGwQc9dGokEsTXZQVOcGE9jYZ
         ljwUy/g4y/puR+3dwvUJmETsTori6QEkMX/6uFgrs4pXztFYo6IX5rcjXoJe7PZy/b7i
         X5kbl3ycj5vPOeAJ5Q0JmHta66uAtdP53Y6YmZ0fTbynurHFczBFzzZVf5NhIswMxhTh
         1anxNJ82PWuLXx6fsKxh6mXaR5CDmZEKR2MC0VbX+PHkdO6CUIGriixJDb0pRpwiLfg+
         ztVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770122401; x=1770727201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufTr7+wzZ2/b+1pjL/6eFzV9KL+yNiviwWGyOeRQjGU=;
        b=EtsyHyCGp3MRGaw6sXqbQbZ8vyCocIK+5fnB29rgNvYpaKVyM0Yk0dNI88q+v5ERsT
         udePXLDPICb5ligPPxeR4IG0PZMgHfgXlajtGGfkh6NVvsOiOwHPqeo7gtIwXGGkWgJ8
         UthKyYj/fIlcBt87pcc1K1vP7D3OqZMSG6lBcuTgTKrCqeBCxNxRShSKA7SnPaF9wYm3
         7SKGfGeNTJSXhX5omteOS988f9D3rRTTjlTPve9sCbGzSIFbUREJRyYiKR+BTUZogrTl
         bQ6E/tqjLJqJzZNCUKfjXub8iWsiVisaOMYOSuh/xSHL06IxVdcfoxUx5wt6bbvF1MeR
         YQDA==
X-Forwarded-Encrypted: i=1; AJvYcCUye3XIH7dWc5ByY/yDQFAoJ4yQmFWZzkZZJOm5qpZziyBFbx6vRQb2UGH7Lds30mf2MGIGVdtgW9i04fH4@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+MTHNdqI8eTOeXVQZgw9hUEnon1aiu2K5FiCFg+1Iwi/P07z
	TbO6oJ6VtF2z/6i0pgXYdd1tw6eUTEQNJY+qNHXxAn/kOlRB1FqKsn3q7xEfqxW1mkDzsA06OOq
	7Y/wDwThPAivzy3j5U4TgmLe5sPhVZZo8eAbWPkhiwrdqQYxMsZW+DYS6/YUyWFLsNauW
X-Gm-Gg: AZuq6aJiYVyNPPa/8D3AMz0Fs1c83KUI6+5u5mmhUx6Ez18LME7qO81/jFHj9I0RNiG
	WSDdMvWWwAoN8/eBDq2czfEAW6zfXxAVOcObB72AqdnTld9OtbDjI22r40MF4f+R0J9SQwDTd8v
	k0LNxfKU+yBuO9HlVYSvvx1N6JBO0YE4RloNAYR0WOdy//6l46a4QzIXvhj8Sv80ymgXEbadqJN
	Mkt1VpiiW21S0Qbazfbri+A3c21e0GYMQx9tnpLailFrgLVyb7yoafUaypr36awMxq/Qz1urSxJ
	BlWiUVFBzVua2F6mJPN9UbkGUbds7yuhqSex90+GpXmdw6vpuBkg58C4U18T8viCdPcTZGe5NI+
	IjVDcvDUJHjTLJ4haV0QPYsgIjlOM09xBCV+zBHzUXF6PwMqq3xepdUSbf41wclTgn+sELlOJ9Q
	qyLzrDSFNNOKUXMe8tjWb4/gg=
X-Received: by 2002:a05:620a:2906:b0:8c6:a8f8:9645 with SMTP id af79cd13be357-8c9eb37278bmr2010936185a.90.1770122400880;
        Tue, 03 Feb 2026 04:40:00 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:8c6:a8f8:9645 with SMTP id af79cd13be357-8c9eb37278bmr2010930385a.90.1770122400389;
        Tue, 03 Feb 2026 04:40:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bc9b0sm4187258e87.91.2026.02.03.04.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 04:39:59 -0800 (PST)
Date: Tue, 3 Feb 2026 14:39:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6981eca1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fMO12ABWoyO7-lQLxlUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEwMCBTYWx0ZWRfX/MM4R7yYNFfh
 nUaRm0GECZ1p5GY9ou5mRsrXuf1M5c0cwZBkgSJk9MTB7vFHPRmrPdCnP39vfaYQSfUtqcmJLHd
 nmSsuyuU6rEZiRUk6uH92cj5776eGAnui14jRYA5bwc+LzdAb492rW4FoW30CuQ+LQgBRWBUfRu
 RzzEdsvn+rtSeXfBFYYVycACdYBx4V+0SoI+Ee363jPlmgXoLy1HEa1dY8mMT4s3RN/yblKIdaJ
 NlEyrdqVjW1wgKJK0Rdgnt+CPPMF74WxZPsFo+svyL9k0ocC9lHwP6YlrawvxzL3gJRYlowRPlG
 oUgMWhuPhvHhUMZ+0uakvTQEyYyLRIDoDmhUyhmkO3rCSKhfiMPYfbevA5GfmzYMd3FZVGGNnhN
 0ujq7stQopIbjl12ODlEt5midRO4EtmGiRaf+SSs5yixan/yH/ojXrh43d7hhLZlEFDXSIh7DN2
 H9bIeNZbjdNoWgbeq8Q==
X-Proofpoint-GUID: uwJMSpyx4crDh7G8LlUG_tID4dRHYWr2
X-Proofpoint-ORIG-GUID: uwJMSpyx4crDh7G8LlUG_tID4dRHYWr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91675-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB185D91E2
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> > On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> >> On 1/29/26 1:13 AM, Sibi Sankar wrote:
> >>> Enable ADSP and CDSP on Glymur CRD board.
> >>>
> >>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> >>>  1 file changed, 14 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> index 0899214465ac..0eed4faa8b07 100644
> >>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> @@ -487,6 +487,20 @@ &pon_resin {
> >>>  	status = "okay";
> >>>  };
> >>>  
> >>> +&remoteproc_adsp {
> >>> +	firmware-name = "qcom/glymur/adsp.mbn",
> >>> +			"qcom/glymur/adsp_dtb.mbn";
> >>> +
> >>> +	status = "okay";
> >>> +};
> >>> +
> >>> +&remoteproc_cdsp {
> >>> +	firmware-name = "qcom/glymur/cdsp.mbn",
> >>> +			"qcom/glymur/cdsp_dtb.mbn";
> >>> +
> >>> +	status = "okay";
> >>> +};
> >>
> >> Please make sure it gets to L-F (only Kaanapali is there right now)
> >>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> > but the firmware in linux-firmware is (now) targeting IoT devices,
> > should we use WoA-like names for firmware on Glymur CRD instead
> > (qcadsp-something.mbn). It would match what was done for the SC8280XP
> > CRD.
> 
> I think it's simply time to stop pretending the firmware is generic
> (some fw simply isn't and some fw may come from different/incompatible
> branchpoints) and include a board name in the path

Well... CDSP is usually generic, except for WP vs non-WP.

-- 
With best wishes
Dmitry

