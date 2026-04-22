Return-Path: <linux-arm-msm+bounces-104163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBSLNI0O6WnrTgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:08:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A60FB44992B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 90E73300B518
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C0C3CB2D0;
	Wed, 22 Apr 2026 18:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoJaC9lq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCiQgh6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78943803DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881286; cv=none; b=ZuyzvCmk6F8kGVDQoHtNgTHoALf0S28ubLalykD4hJW44eQ6r+4EMqIHtn/i68HxKSUXA2RxfvjoN92N59lCpeC8n/a8efrieOIzZ+QY9LkAmJ3WBZ9/T5JUTOD20ZPrvbrp6GKcY+9B1dDioQqoJMhkn+EtXbLfuC4MRFXs5y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881286; c=relaxed/simple;
	bh=2MKFckT00bTwLAjGaS/QIwQtxJ8WdHDdfKt1/om0TOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dK+OdGLqQrvs4bZqYoVNu+2LcdYuZ0DFODQW2/7oj8ZYP2piDj5fiXox+ShtHekzhZV55xbajKux9y6btqfYrpKSed5DPc4xxtnfhReA4tl9gcGqF3IydMOeSkPtc3u0Pr7WsGOgzWCJNBKISuOpQfQoHv3PEVSamK7zj+y5Ruo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoJaC9lq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCiQgh6v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG5KG72185960
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGL4W3xafLhI67vmjRtl0nco
	D0XbB1cd1uhSpe+TW0M=; b=OoJaC9lqgEKcE2wAFxoW6RcuC02T/dl9pGl07078
	PLGQivfXNEkEoHBv7IU2pBKY5hJ9n8/+ElJ1oxGieBB32DHjqtYAYzv62fmEF2wJ
	GCOQw/48yXdZYq1Hm2lLlmqglEb6Y4mo3N3YSwK1h3KXtpyOqOCLsgyBsM8v5Jdl
	7oQrBM5ciU9nkR9dviLVO321E+XZ2jV3SZBuqVr08hlZiB8I/BDDSuU+4ZAYN6Ez
	NLF6Wr9IeBzO3XCGPaSbI7NOFcZQCYppu6C7nvNGWEQAnh0D/G5IBjCKvbWFQlth
	t7q8ctlhA7DVYsZA5+kWOAE856DOkzqlhCDWgHuHpSOqmA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hvgev6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:08:04 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953a7e2c35fso2743110241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776881283; x=1777486083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGL4W3xafLhI67vmjRtl0ncoD0XbB1cd1uhSpe+TW0M=;
        b=RCiQgh6vtm9Iu0w36zHq7twanJXryCs/RTZjadW09irlMduenzD8Uk3rVaPrmTGvDW
         AnvV/BHEWP0Gkk83PdXrhCSJWOaMFjP/Rd3vprN7qBg6eXzRPAAazf5DNKX6hMfDBM6N
         zZjFX1LfwWcM875mXsYVW3hkn6GzLnRCCiF/UF3ij/lj9XD1YK5heFqHZ5yxkgJ75NzC
         R35SVnvQtzJXfrYY5dhhy1qxQJwlx4h3x92iKK2WkUwLxrlz2xTkO8Cyt2Dyr6se0Umr
         9S/zZVd+1JKqp3RmrDtjFvnGb4ccwyY9jx7cuqsi9biLIpZspgr26+XU/B8BRFmfOclO
         hCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881283; x=1777486083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGL4W3xafLhI67vmjRtl0ncoD0XbB1cd1uhSpe+TW0M=;
        b=NnNTA37oE20rWdf8xB1PuiNMDfBr4FNMB0jx96w7IqpgGJLLD6UbXwMvAPNnG/NElT
         9oI4PUsdL14ICBV5AHBjqKzoOC/tb4Olx4nnUmlqKqnJY1ZK9il4CwLPmeKkawWedsRD
         Aehq11IE5j/XlQfQ/g0mkStlj2TWexpqOEx0VazMuCtqCdaHW9UQMlxTPcD7MlBd1d7L
         4jRSC03B/2MQAMcBdv/k+k2nwsYXgig3bbmN5bSWCkcfAvm8ayf1m9hnp83M6N4jR1uv
         t8cue+RAtACfwVnON7gvIZRg1McqeIdssanB+Wkuesoi1+u8f5ZQcfFnzOCkqqaMplT7
         7vDg==
X-Forwarded-Encrypted: i=1; AFNElJ8uIbTGioPbBFdyPbavJlt+oGTUHate986ItBfosmBjP+u58EPsHAhLt454QUblkvaxMUxqIAu/HVdG2t+n@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjtb8ioyjD2PyOZKpn0XDx98KGEfSwkWfrHX6E1MJkttwlwD4r
	vm438nuPXRNAFAoW6zHErzelo0hZ/+am5Nkfq9D0uVZqCvoRZteb8Mk4UyY6axx+DvSPlZ1u65L
	eCHSu8v7FW6qM88YPs1CgIK4seYjSqZJbuHep5uw/R2DgcOxuO4IflzfmxGpe0C8vWomuaonLtR
	7x
X-Gm-Gg: AeBDiesrrBCy7lHLtFf1tEst7ekQAd2Od8/QXuQTRCx5ioJdZIJI0WVgTXuX5lhAcc3
	STu1U/rbDH5cFtd59X3bHJ6ADOl1xJa99Dk/gjCjxKYN+GYCK6PZswTdqsnzJFfOT+ZEHbb0jQf
	vTow4+o9KIep2FXGP/XLB66FbpjlCkYyHl/+BWt3I2OkKxIUxM4bHOv2dtUyhIRp8IZ00Eq+405
	GFPmZcgjdNzq0uS51uvbCZ9zaUaGLshkhFeoFimtxgWbx7Hf/DAPY1ZrW2eWlWQyAYu2eZ5q+s9
	KsqrnyYo5BuKclHZx+xMOG8PEKtEb7YyeVDwI3KJOZU5HjmIhFOWYQ5jjH/0FMbietOfrG6in/4
	1X5PFefb6tjN68dkZyD75eMQNpaxsBRhuLvys8F2H/4kjQ6gwepewjOFxqqhM66vTobkAXizCCi
	xAkyAoR52uKURYtpkheOQQok21x23lNcCsIVLw8qDd0ihQGw==
X-Received: by 2002:a05:6102:8547:20b0:61c:5310:e9d5 with SMTP id ada2fe7eead31-61c5310ed40mr3805616137.20.1776881282710;
        Wed, 22 Apr 2026 11:08:02 -0700 (PDT)
X-Received: by 2002:a05:6102:8547:20b0:61c:5310:e9d5 with SMTP id ada2fe7eead31-61c5310ed40mr3805575137.20.1776881282071;
        Wed, 22 Apr 2026 11:08:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b4csm36552181fa.25.2026.04.22.11.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:08:00 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:07:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
Message-ID: <cap4ajlodabckfwex2p7oa4jwg3hekol3imsi3fb4et4jysd6a@nqq3ckywtsep>
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3NSBTYWx0ZWRfXyF1riFJibZZB
 unvUBLnNscS/YjNaT0+BLNliEPF5IkdWU9qSIBHro6avZV8lRtv8wwTR8i4KPhBzR6cSxm8+FjS
 v0ypRzPlx75EIGQA7ogZgCLYwknfmeLy2jds2Vxcs+vDhkbrAEAfSfReVFH1ZkFOfVoAZ67EjCf
 J543zS++eY3QHs1rlHE6s4Mh/MSRRgbbOgZXc7tdiKBnZ37p16LiywCdIWqBvqBSsZOvO2AEmWC
 eKs7MXJx6CEGZg/+2wRt5lmrI2W/1jIvvbnEBleIXxU3Eql9dRw0iB3or0N0UqCrGJEQc9uZGZU
 YLGdeWv9+fhZGAZw+KExbWwCYGrFg/yoiroofSS2kAMLwmqRweXV/pSu5M9yC747h/YSVsV+JgU
 ROs3htcKGhcifFhdNP97HbI2Z1O2uhlJd+UyaA92VkAC0DMmg4FrQryJOloR/j58QITr1bo5NRF
 wZEDnP25fcGYUOJM5ZA==
X-Proofpoint-GUID: LHS8ax6Fg2q1rKZNiJEP6Qk8TL6Gm9B-
X-Proofpoint-ORIG-GUID: LHS8ax6Fg2q1rKZNiJEP6Qk8TL6Gm9B-
X-Authority-Analysis: v=2.4 cv=HJvz0Itv c=1 sm=1 tr=0 ts=69e90e84 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VcLrVzLNYlVDUsZrKLUA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220175
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104163-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A60FB44992B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:30:02PM +0530, Mahadevan P wrote:
> Add the mode-switch property to the QMP combo PHY so that mode-switch
> events are routed to it, allowing the PHY to enter DisplayPort Alternate
> Mode. Expand the DP data-lanes assignment from two to four lanes to make
> use of the full link bandwidth available in this configuration.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

