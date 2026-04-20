Return-Path: <linux-arm-msm+bounces-103672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCSLOFzQ5WkfoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:06:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7DA4279B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3D043006F12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3BC37FF67;
	Mon, 20 Apr 2026 07:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKWnXsIt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8wNsxuy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36B6378D93
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776668762; cv=none; b=Q6zbj3PH0KDncCIqjcaaYY68ixdXXfG7i7UPAEDs2nctql/dMmVC6maCws2HaBgMp9xTVejCIvCmyzwx3RZDp3RJeZrHQFIuGGBqdF+Kf7YjgIIcC7lqTSU31b7o1C7rvihtCGxJLIrDdnuLDAr31yXbARzCTSSM/EUF3VSY+/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776668762; c=relaxed/simple;
	bh=Jw7mDwIsuIx+4zD17EmNypYWR9jmkfAruhwNtU2btpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c94t95s9H9Ut75x/PhCfN3HAhidvsJY+JEt45nl51XD/DDg2SDWFkAci1fRFrFrr7DohgUHHGih9Jlt/qUjOOxrJqU0LCk2QpfayqceUgfAwwPPTkR+a5Fr7Xu1oe4p928pC4fceSTF9NvUWZaNv3TyjiGL6D/CHnUrsHiK/VWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKWnXsIt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8wNsxuy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JLtDpX2791024
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GeJ6fpnU969
	i6/hRfUoKXDZEOqk6TsNNPMvVeYit3yA=; b=eKWnXsIt6aab9IgZjzG1PRrEM5M
	9UL7nrrqMsm/z0o24MzL6sR6D7XNVZzUexVXulQcwDMgIpXZ73l6NXZcc2pElH4u
	TpstcQrf7W60wGSdmdJznejNXVpMN1vER8IFK89lUwzxWAj1OBVUgGaHWYTXtqjR
	icnVtROKVgqUBxf6U7dquVjFkSxYYi3zZt9g4NhiFzLF14Ug5xYP4fM0syObP+zh
	x7qAqlZlDREflksgbZf8dU2jlRLEkalcKO6b5b5PZhf8jPxnZqXwKrVqsRlI/bgH
	jwZKEGrilZT1fJNAIlfIy3jl6KeTq0f4XuV0C3xqLGhNF3xFyKwl0OQBfAQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y64pr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:05:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f220f1dabso1919611b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 00:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776668759; x=1777273559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeJ6fpnU969i6/hRfUoKXDZEOqk6TsNNPMvVeYit3yA=;
        b=I8wNsxuyuTF/mVyWbHVKo5k5uQvGqpHbNS1TguEq0sDLdM0gZ2UREDaYQNpRBqadRo
         3QwuBhWePTyyWkt7Fm+cS1kDbr3JxA5mnrJH5jqQXUVUa5DWpdST5cmQvV0yfFlLlgVD
         1WgjW9R5Bsm/vxNpNl7Z1Or3plY3wWQ+CRJgfoamcch6tLylQV4kn/berGC13tAFUY2I
         m9Jh/8ghxyedcgsBG0VttoURYrWrmtfIYr5e3FEkR+Zkf0k/e4J67ftvNge+E5UPQdjJ
         DKylkznQ/VV7OAtroLCsbmqKhQ8+wVAmyJuc4xZHhUaEx5FxkRcWNTWgEdVi2qNfG35K
         0sSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776668759; x=1777273559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GeJ6fpnU969i6/hRfUoKXDZEOqk6TsNNPMvVeYit3yA=;
        b=IG+cDjB+kYQzjaTfzHwrLb05Pn67FQL3c79KG8RH3rklzIePkHIscj8WJEORAoA5eR
         GDLngvAWqiECvbVZg0htCad4L+pRnhP863juClUNqdRVajj+zOUemu1jDIL4nmE0Z87J
         TCDOFcO+wpXxb4lYb0nge3ZKgxUwt/FODLcdjKaVWHDsJYyKh85Akx5l+ZbhZKGVY9pV
         gLK6QJr+S1yPMtRTOKVB8jKdptw9kgAE3g8x2LzAAv90vsnqmzPCXYBN7ZGdNDNsFCSu
         YhktxRb8o6qNGxnIMlPiNJj31culTnlw4LNJnB4KNBYDznDaxwEem4hKNxP3QBTNIZIi
         BrFA==
X-Forwarded-Encrypted: i=1; AFNElJ/ctmepBq9aujXsETILra6TsrIZD3SQTyGNmxuzG5tZF3YHg/RbsFWggfGDCh+viWa/29uqS7nQ906BhMFH@vger.kernel.org
X-Gm-Message-State: AOJu0YxEtb4auwWlHdBM9CVSBRTX33z9Zeh4ujSyHHagyPcwgCQkcz5v
	FgeteN2V7nAJ5y6S/F+DMQgkfmjZNkG1CBkMyz+o2Fxj7nAnb4744o2X9CPY1luLtj8I3eoaz7/
	V6daxmrnkoKX82HoBltAEeyVGN0EHSkgNbN4LPVAgzMRsVK87ux0WNKzL/wQbme9vSNUG
X-Gm-Gg: AeBDieuaaxEX4xXCJaE1lsaIyXNWu0+WcQ5O2e1QLm6UpJWPGNVzPQ16tAEbNmj+BUR
	M8H+qtqCxrP9KBaUvr00zXpR6UM9Du95OphfCnPPQ3jzRDbKhPUew7zEQfipAc4m1nvCA7ar/xF
	RkRW2jAgUi3kSu2G+jOGya+IERh2nDiL4TQyDkNpl/sRX/o/e1OTzCvc6KS5/1v9/t99AzF1KBo
	xcIiw6sWMr+3tE0Sdcx0sBZqa+H2PfNYWUiEvyA/Fbd8GVZjoLWww7gFFh74GHeQNpbp0W+0vML
	Cq6slCZrIhi32LXKoLDqB90/p9xxdZgO8voy1bHd22zH/eaVr3Agstkpo0RFhh/UZ85IPHDySt6
	zJDBg8jJzd4uJoEAmjxNHFQ1gxDbiA+V6UhGYhaqzZucDP+qRgahHiP/1ZE2LEqE=
X-Received: by 2002:a05:6a00:908a:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-82f8c90c380mr13948914b3a.41.1776668758664;
        Mon, 20 Apr 2026 00:05:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:908a:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-82f8c90c380mr13948884b3a.41.1776668758194;
        Mon, 20 Apr 2026 00:05:58 -0700 (PDT)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9fcea9sm11751925b3a.23.2026.04.20.00.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:05:57 -0700 (PDT)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mhiramat@kernel.org, will@kernel.org,
        catalin.marinas@arm.com, ada.coupriediaz@arm.com, dev.jain@arm.com,
        yang@os.amperecomputing.com
Subject: Re: [PATCH v3 1/1] kernel: kprobes: fix cur_kprobe corruption during re-entrant kprobe_busy_begin() calls
Date: Mon, 20 Apr 2026 12:35:52 +0530
Message-Id: <20260420070552.1747992-1-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aaWS20g-jGu8mCKH@J2N7QTR9R3>
References: <aaWS20g-jGu8mCKH@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JETa22236T_5jqCWLxQyiKLkCjF46YoT
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e5d057 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=CdHHS4RwY1IrjTjwd6gA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: JETa22236T_5jqCWLxQyiKLkCjF46YoT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA2OCBTYWx0ZWRfX6VlRnK2BZ62L
 PEl72FB+MNN+G4TNiUSlOTYLD2ufAGrvXXqFVd9MDVhwU5OjYvsI5w4UrbgNl1GrDPFdRA7Ob5J
 rdB+m2N+q5r5h8oyZWQ72aD7bBcYCelrT2MK0xqUbto1/oEh0vdEQ7GattJj35uiGH8m6y6vXCO
 IHWglWHA2vfnrE15XsX9DHQC/zfKuai9RVYSKdcapWVb5uLo13I1PfIUt7lxacrnOJlKO6e1U5y
 z0ZypajDYiRKRy73FeKdVlKLx9Abt5r7sRsMQPdbBNZQi5onY0lt9lyj9cpqm99GGw2RA+H4sG+
 alELZYIN/2RkCTkedFMJ69oUkWxghMOe0/cciSzezYRc0jpFrgzGIFSAxiDhnUsnNp1eabJtjMq
 KKcOe+yf81esh3PNplJkgu8BHPzTnnJmIxUzPluny59EBMDNqVaEblruLYRk+78qz/xbEkwcQrn
 hcDw0Pk58yrW4vVhFgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200068
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[khaja.khaji@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-103672-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 3C7DA4279B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 02, 2026 at 01:38:35PM +0000, Mark Rutland wrote:
> That suggests that something is going wrong *within* your entry handler
> that causes IRQs to be unmasked unexpectedly.
>
> Please can we find out *exactly* where IRQs get unmasked for the first
> time?

Thanks for the pointer -- that was the right direction to look.

You are correct. I confirmed that arm64_enter_el1_dbg() does NOT re-enable
IRQs; it only manages lockdep and context-tracking state. The IRQ unmask
originates entirely within our kretprobe entry_handler itself.

The exact call chain is:

pre_handler_kretprobe()
  entry_dwc3_gadget_pullup()          <- kretprobe entry_handler
    dwc3_msm_notify_event()
      _raw_spin_unlock_irq()          <- first IRQ unmask (spin_unlock_irq)

dwc3_msm_notify_event() is called from within the entry_handler while
holding a spinlock acquired with spin_lock_irq() (i.e. IRQs were disabled
on lock, and re-enabled unconditionally on unlock via spin_unlock_irq /
_raw_spin_unlock_irq). This is the first point at which IRQs become
unmasked.

From that point, a hardware IRQ fires, softirq processing runs, and
kprobe_flush_task() -> kprobe_busy_begin()/end() is invoked while the
kretprobe entry_handler is still on the stack -- triggering the cur_kprobe
corruption described in the patch.

Regarding documentation: the kprobes documentation in
Documentation/trace/kprobes.rst (section "Kretprobe entry-handler") does
not mention any restriction on enabling IRQs within an entry_handler. The
only constraint documented is:

  "Probe handlers are run with preemption disabled or interrupt disabled,
   which depends on the architecture and optimization state."

This is stated for kprobe/kretprobe handlers in general, but there is no
explicit warning that an entry_handler must not re-enable IRQs for arm64.
Given that entry_handlers are user-supplied callbacks, a note
here would help future users avoid this class of bug.

As for the fix itself: we plan to carry this as a downstream patch for our
platform. We are not planning to push it upstream at this time.

Thanks again for the detailed review.

Khaja

