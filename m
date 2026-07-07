Return-Path: <linux-arm-msm+bounces-117380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GDwfFtNBTWqdxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:13:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D840771E843
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:13:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Gduc6Gp3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jKATZFXw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117380-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117380-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C052300CB23
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 18:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E5943C7B2;
	Tue,  7 Jul 2026 18:13:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9373436BF6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 18:13:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448017; cv=none; b=CQjcUGqEJEe8r3iDPJxZr6oVLst9SQ+D8JTKlivir5oT0o/3o3TxuolMlqzdsfAwWYMbtMzqajfns1LhwZqJfd+EqCzV+8+sRvvjzF6X6mBbg6Mm/hgDEXbq3qm/mVIG3Pkm5QqqWiHsNwvEoa9tDLiaTffbjn4o7NzqC41k/6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448017; c=relaxed/simple;
	bh=O7TeLys+hlkPql6XQz3KimSI2a4UVx/m8erQ9CsXTyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZtI8ORjqTpKgf5GPZ0SzMBcoNaVgkT8Z6q/t74b/qrTkUDYx6jcPUOKjGhWDcrKdBiln9CkePyhYlnKTvHctQqfJCZEPbdZJ2EDb7Qt3N5fhfc8CKPxK/WdWweeiH6A9JfocMe4iHscqPyDIdG8tFDhJ2NSMKhYbrU3fBtZVKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gduc6Gp3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKATZFXw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT7g94045099
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 18:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yg6lL+ira4Exk3dGLkb6IIqE
	BSIlHykc4beJK4+FcZA=; b=Gduc6Gp3BrtvtyLtlZP7yUCRuZ44QSvAEFID9BmR
	dKaHqvybHIH2rXQjbUSWxn2aOPoOqO35UN3xWak98KifYp82OTKnAY9UTq5+9InQ
	ethqgyuJolfesnx1MxcfdqKR4PokqmMFtHu7EswgzoKKJtIBfJlpwK2LrXQErZL1
	eYREnR6Jf5UcArlFDfpafvHxSZRoXXtbsaaNmp8xxZiOHmJwKHIift5T55B3QzcY
	NTIh/CXJ3dWyTHENOtb4NrmcZIRKR/Dwd/iD255yCGfqvheB+0QZYkhQvQzBUML4
	OoHoGl+it39DNiWbtId8eQZHPah1CJ9R8fu/2Jw/yTww0A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2uardg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 18:13:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738627c7908so1211358137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 11:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783448014; x=1784052814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yg6lL+ira4Exk3dGLkb6IIqEBSIlHykc4beJK4+FcZA=;
        b=jKATZFXwQTmkMz67eK5UYzsnDZe6L93n1KMkIU7qT2JZUXqsuM76U1bPrshHs9cM5C
         n0huIlAtFFq8KKYRMfXQOMFhAyrU+4/40YcvDXPB1muCbjYczFTY95BInyIGkzepjgUC
         eDuTOvjFPIQBxxo5WyA8HGSo280Z4Lsdo6HNOI1WNYDcLnVuRkDl78MzIXS9ovfhWCHW
         X1E7wlM02DK4tqkwFvt43pOUlO4wJNFak25Aj9ybNSZTWjojIW/IUUDR/bn+Zjk1ordf
         ohP+Lg+RqdvSE5mmxFyrpkZzjkBWdAW/GYgUpppFViaSvUwJ302M3THxd87VpE2vC56j
         luQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448014; x=1784052814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yg6lL+ira4Exk3dGLkb6IIqEBSIlHykc4beJK4+FcZA=;
        b=Xh3Tzpfdyh4BJCezWyoMMioMEjmsZCIDQgRLvd4hJFN3F2k1y+1Qyh0jwAgdyRmMEL
         RotZyjaqlnRX/2YujjbScsRoW69HcreptY9hFDT+Il63DXzdocVaAWQ/SpbKGEqN/CXu
         RVXnE5Kp/GE8N8GIZfbf1w7g0Cv8S5J2mVg38WwHZ6YD1EK7cl2b1iNGXNWwbKnJLrLh
         g/aNDkkPDt/uDw2NlEWYBPo2cqt3pjfhWpR/J9jgemqSld5xoJchI9Yjro0qVl+XhFJa
         p2u5rec9h9pigOcEyd+kc57xH4PWbJjq9XD+wW7ZiPQ+juLq9trsMYCFL4LeCgsMnNaF
         g+2Q==
X-Forwarded-Encrypted: i=1; AHgh+RozTkmWo6/UFNgR0sCrzI2fm2LluN1WhoUIrofszUgIYAJG608kFCN9hcSS10GjrrhBZuXDceP9V3QRbVxF@vger.kernel.org
X-Gm-Message-State: AOJu0YyBNJnexWgayX7r3/MsCDQkFdq2vPd6VKH5mDN/fYbWMjie4kEl
	PKAJEcdqDkTX0Ywt+zIMDJXUQx/SllKImEbBIfr2bTIyFKYobsjh5ZbgrwCJqK9PFT5chjVe42/
	H5EZCGUAmMtH27woyFCGZveJBTtUd15PE93ZLabkCLJ65VJ69Kg0ZW3LSGQZyW2bvOm/dUE/BZO
	PQ
X-Gm-Gg: AfdE7cmEUylrvtqf80URphXd/kLTxXuAhLDwLmAb6wIYfP3qyT2/PaMeswQ2LPjl/KM
	fZWPMq+vWWFWmWnh0DVaHsR6up9xyLjBmRu+7NGhLWOreooUHuq9cz4+kccpECuzVOz0U6Rhjhg
	j0B54Nnpav3s7yBAzV4paqMiOWYSycE+JJ2vqAXj9O0PIJl6MBN2x/wTTPzYcEg8Baw15Hu63/q
	793PXi5EmPJxe3Gib0gYSSW1i48KHUA8Vn+NTF6gwUTTftNXDlPiXHUF+iUvIhv1wSRWIFulgYt
	xiXlc5hEiwoBmNIQqvxV5UIUMRgfurcCQXqFcb0fzoj6+rqz/ZM2CG9PoVll1eXtSFLrXdmT85x
	slDnIVJtbku7xaofXFH1O5qTR1b6mxLfiE3KoWFD6MFHZG5+2n+WCBehPpgDZWGy8PHjpXo2l2K
	iW5TEowWbH2cgYR/MPNNTK3pc5
X-Received: by 2002:a05:6102:579a:b0:722:a46b:2f2c with SMTP id ada2fe7eead31-744b7d2efaamr3505954137.15.1783448014012;
        Tue, 07 Jul 2026 11:13:34 -0700 (PDT)
X-Received: by 2002:a05:6102:579a:b0:722:a46b:2f2c with SMTP id ada2fe7eead31-744b7d2efaamr3505935137.15.1783448013563;
        Tue, 07 Jul 2026 11:13:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5cf9sm30864641fa.21.2026.07.07.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:13:32 -0700 (PDT)
Date: Tue, 7 Jul 2026 21:13:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@oss.qualcomm.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-arduino-monza: Add label to
 sound node
Message-ID: <elehtbf2uk5pmxmt7gltafhw3cdd56dkefyk6pt3uawtoleo7r@iogbtibfh6uf>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707163703.233405-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX569YX5RX1gJ/
 +5YeFCBYe73LW/vLsbGzBdU1sMSE2sBmkOJdwgdXZ9XCtl/f86CQwkrwkcBSgcYGNw5syeo9Edg
 VIWJ31h83vAUo2cShUrAnxB7KGs9oYs=
X-Proofpoint-GUID: BnLUMs-o7wtmskQcrwmid_bewEU4dsKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfXwuXVgLGtJtKE
 FkPE7g+Znthd0cLEAsMpdEYh7lw446c/D2dKyeMROXFLaXDehuHTP9oOrQJdhXYe/S4/iT+JQ5O
 /zEhonjBhNis6MsFyK2ymwg1TqMAdNr+bsdeomWBMW1PdrmUvQRpV1jxUScu1ZihMVulpcDJLpf
 jPs+YSNP5jqeNU9tr0N7i/sKUR1oPL0r0MqE4JxhEGgPoLMfidmLsT9DxXJAM5L8IwLuWAH2dJm
 xoayZbfqzQNbkdp1PUlAdmLoJcbqn5lnmaw/qIwHgqr+jGT/G8ePV8ryB/HdG3MDeF6ITktQaFz
 swF1VeGZWz0LBkEC//hVM/KREWnELjFlla4mHPbHNEzoWBkZt1Mal5eQ0nlmHz3mCM9/dGM3jJp
 J3VXaMfX8jZIo9lef19HE6t2qC9g7dMKeJgzTVGZcRvGRTwxv0fgH7VNy5z1AmNgU/qRunLJgou
 2ON/+pe64wrq50kmuBQ==
X-Proofpoint-ORIG-GUID: BnLUMs-o7wtmskQcrwmid_bewEU4dsKz
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4d41ce cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YRq4iih9PaHNJmzARSIA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117380-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D840771E843

On Tue, Jul 07, 2026 at 05:37:02PM +0100, Srinivas Kandagatla wrote:
> Add a label to the sound node to allow DT overlays to reference and
> extend it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

