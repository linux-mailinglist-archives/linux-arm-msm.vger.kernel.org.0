Return-Path: <linux-arm-msm+bounces-107248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC+uNu1LBGrNGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:01:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4853110A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18E2C3036ED2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB08A38757A;
	Wed, 13 May 2026 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TeM4vG7o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmvRzpwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CE43D7D8C
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666291; cv=none; b=paNN2DM2bzNcnOyHee7dPBt2Wfai76VaQIdEvmhoFoImUCf9Zw4qa+LbI37syCNcRLxRrU/vtGKucUFdjhTiP6Hja4BTJa2JwVBj9Xk7CkOZ11pyY6qWYbMao6HsWZyfu7B6l2JoMMOEhCCpBWQGhZja3JcxX13fLAoi27KCTRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666291; c=relaxed/simple;
	bh=0DvzL/lRO3EBh+6Qf/qJqs218/X7TDeuT82d1TDEtaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+hEbQk+h8DKm+3J66SJSxjQ2cEzx1DTmCn04uSkW0+QBcbgKMY3htWJlyS70EyTeK0oB3AvwTaZm+Wzvy09FPS9GVsaolXuhyucqOSjfWCu8oQ/p2muu/FM+pgMJuFlWTl13LOrB2uQN7mEstK7XdLRFLWxr6J41QJ1OSDgaig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TeM4vG7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmvRzpwJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p6Vo2338782
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6xPAQBS3NXy8Dk92Q34QE/E3
	JGZz519NdmjNgW67tP8=; b=TeM4vG7out4fGDN0REjQ2ENcuFQynG9I6Wg+DfS9
	4WK/8ScUKV418awh3iDIzHWZYyQBlH6MZlkpqqbINTEvlqklfsEK75cKVfaDtb0u
	CZjpTa8whutsrQK3HYU4AOgdGMgJ2OqvejIKGuU23rwczOiulUm8fmA631Y5Gtrx
	weM+FMM2wB4Zg7qUE2byKdMLC0PT7D8hFY+3igTQSZ/wUHETLDq5l4kLdbo3+ac9
	9I3UtBRfP5ud4bQOvQyZMAMAKeYiDr0Ssovm3VOgGGpxiLaBuyL8RPw4nw/VQ3XZ
	MhpVgyMtcIAydeOOyahxtxkOf2yQKfSp8z2AfGlLQLKRoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxavdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:58:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51494d74d4bso103019531cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 02:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778666289; x=1779271089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6xPAQBS3NXy8Dk92Q34QE/E3JGZz519NdmjNgW67tP8=;
        b=SmvRzpwJE1tWrqrc5PQfpW/ROMjGmZqTT0OzTjCXWrxcp68wyzO3uxfV3/NplaAEW7
         +qu7jf0ie++P7tJGAySvTk+Npth+cjY4jMneo9uVGElZbCPNpdyScGKpF9keh8756vZv
         FU+BAs7p1a3TgAkEIa9R6bP40K220qlg3beDjrXKKgInZxx1jcXH7XHQIp77aWk9Uo3L
         bXd7Tl6g164l9XaaQv4fxg0OJoBt3j+cAfeKKuWLTlKZwgPyzTg/17ZKX9NQQ35s5Zvn
         9xk1ZuWAayUjwlVTzwcRXdwGLzWwRlLbqkBRFkZf6DOOxTcmSYE/75Im05O8gGqU1x9S
         zAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666289; x=1779271089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xPAQBS3NXy8Dk92Q34QE/E3JGZz519NdmjNgW67tP8=;
        b=QZHG4lEf1TI/GPb7yX0XzddDjxzcu8J/cv4E2gO63Dk6sKCn+UkkhGXCr0vtJZO6CU
         yUxq8u2/hMEEpBAAy0HXTNL4cq1ytRk4j+w33bzcoYLteINOTdBTPXeNE7+FOiAhIxHf
         106UMOhcDXS+RwVCNrW33AK2gTauxU8STDVjgPg2iPemWt/62SJDQ9hPcjLApu9eTYMl
         lfPK7DRBZKbrBvr7yKkOFf0RKWIwwOpzjQlEZrdD8+zOsH2bvdJFgAwSLLqQG886fCiB
         pY1YraI80ZoFORoZ6iSFyaMf3xjttRIGvEMSNey+XWfMV92yFt70nWAZvZ32L9rxCkEr
         EE8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8qF6Z7Ug7T+XtLIdY/TQWuvj8AiWvVZMNBvx8KoAu8HP6tzXAUfFbbpz/W8VlKBfFNPDsOVcjYB9wK6J6x@vger.kernel.org
X-Gm-Message-State: AOJu0YzOmHKCVxqjLpvTjRabjo60bDj06hW1FCEV0YJ+GN4NG+BAKLJp
	BE9MdftwJl1mFAQiBVNGyD3ApOzy9EMruhKehr3y2JayMkE2ayJB57yICLGtwYL9ZRhf/puplw/
	7YjG1wYxQM7BqvoRX7OUM3XS6ZCWFLOfwyDZs1ph/BcBDw5l9TQGtx4RXhCgWfZyvtFJd
X-Gm-Gg: Acq92OGWjW4KTeIBxysC58jBwOuwjMAgMKBajHocVRhVX/4HMmwSyh3V8b3fhyZgUOQ
	rBAJwV1LbpsOV4fn37bfpZMe8qrvJhwbkk2jPLpbJ3aZRjXbjRq8siG+hQl6keJ01gpF5QJ5xxA
	apJKPAFtNWuy6otMB0RxaoueRv4Ac0mJc6ZkOESpdnfnqT2I3Cfva9REGFbNpvrxKv9/WiCMZoO
	PjeEAiOn+G98xTE/f2ZFaJVlUo81Yuh/ypZHOXa3p/GvG6IiQmfq+nTKf4ssv+qN5oR7PZNo3Vk
	Lq+FSQuYkN49Bf6AzKpcXmKjgzTu9FfaSPa30+FGD22GpAqO0x/ix//FzoBThgXomjh7jeCDDMR
	NmhZ5zj9dfzpxvHdccOIcszNfLIOES5qtLvvs
X-Received: by 2002:a05:622a:1196:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-514cefd2ae5mr89182051cf.23.1778666288812;
        Wed, 13 May 2026 02:58:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1196:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-514cefd2ae5mr89181891cf.23.1778666288318;
        Wed, 13 May 2026 02:58:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491da03a7sm39993667f8f.33.2026.05.13.02.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:58:07 -0700 (PDT)
Date: Wed, 13 May 2026 12:58:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Message-ID: <inf6cqpumbmo5eq4jejsfhbsqgpimi3mjzxwxk4bn6cvlwgjfn@d5judcn2clxe>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
 <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
 <7a6tbenqnogpk3pbigds77ogo2zambykt7i7jshjhi36gam2oa@3hrp3icontya>
 <66po5l2k76hrlnyyxx5hvzkz7wng2rwoskrrcuti3cbspmsgwm@ee6ijyw22dg3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66po5l2k76hrlnyyxx5hvzkz7wng2rwoskrrcuti3cbspmsgwm@ee6ijyw22dg3>
X-Proofpoint-ORIG-GUID: ugeMIgx0Ss28JhK0CO7S_UhFWS-fHiVY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwMyBTYWx0ZWRfX11o+twPKH2Iq
 GU83UvpHoTKruZhIQfstYLVNmtfCaeMVu/C/eYjDRjAOKPolkEKXvx0tih4Lzy8Zwibh4JF7st0
 YMZp8EHpYHP/TdAkUMBK7Tt8oZlRahorT5bpLukQzftQjXWXx8X/veOnp+3YUxQL6/C8p2lGz6D
 5dWbjg1PKaWV+RyHDwkJa4q38HV/jZci3p2PsXvy9u9ASJ51iTad2QdcDFQSDVVXiqRJHn4M/HG
 MXJv28lNIKFVt35tx3yK2HhF1EpTIqIGZ4HnFmMYekLJtuVr1Or+W/Fbvbxrm/IwpvG4/Nbv41H
 OJ7iHyAbEHwc6VNr3ICdyV43SsrT6J0rkCxc1kyCCemoVincJvnpOvEAWTEC75OpAfamyLxmVAK
 15ncNGg8QUI2NyWEsG7ie/0uYz+/ahQnBdPK+qkijLOga80jBZUbTUeLSOBhuETjN6py7N0Dd6k
 c4YnenBxTwvfCJ378jA==
X-Proofpoint-GUID: ugeMIgx0Ss28JhK0CO7S_UhFWS-fHiVY
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a044b31 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VxWbDYV3Dua1dd-2t00A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130103
X-Rspamd-Queue-Id: 7FD4853110A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107248-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email,oss.qualcomm.com:dkim];
	RSPAMD_URIBL_FAIL(0.00)[0.0.0.0:query timed out,0.0.0.1:query timed out];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[abel.vesa.oss.qualcomm.com:query timed out,port.0.0.0.1:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-13 12:44:00, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 09:10:13AM +0300, Abel Vesa wrote:
> > On 26-05-13 01:04:12, Dmitry Baryshkov wrote:
> > > On Tue, May 12, 2026 at 03:26:49PM +0300, Abel Vesa wrote:
> > > > The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> > > > routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> > > > 
> > > > Describe the port and repeater, and enable the USB controller and PHYs.
> > > > 
> > > > Also specify the ADSP firmware and enable the remoteproc.
> > > > 
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 81 insertions(+)
> > > > 
> > > > +
> > > > +		connector@0 {
> > > > +			compatible = "usb-c-connector";
> > > > +			reg = <0>;
> > > > +
> > > > +			power-role = "dual";
> > > > +			data-role = "dual";
> > > > +
> > > > +			ports {
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +
> > > > +				port@0 {
> > > > +					reg = <0>;
> > > > +
> > > > +					pmic_glink_hs_in: endpoint {
> > > > +						remote-endpoint = <&usb_dwc3_hs>;
> > > > +					};
> > > > +				};
> > > > +
> > > > +				port@1 {
> > > > +					reg = <1>;
> > > > +
> > > > +					pmic_glink_ss_in: endpoint {
> > > > +						remote-endpoint = <&usb_dp_qmpphy_out>;
> > > 
> > > No redrivers?
> > 
> > It will come with the DP support.
> 
> Ideally this should have been a part of the commit message.

Why mention something that is part of a different support ?

In fact, there is no repeater, there is only an SBU MUX.

Which will only be brought in along with DP audio, IIUC.

