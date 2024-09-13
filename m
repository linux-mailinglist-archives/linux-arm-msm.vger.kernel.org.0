Return-Path: <linux-arm-msm+bounces-31768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0455978682
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 19:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 823801F22F0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 17:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3930F81ACA;
	Fri, 13 Sep 2024 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b="nTqX48mF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6C5824AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726247587; cv=none; b=X52Mk4P0JaXLl7SCytNHURyVr9pWQgX4cS59kNlFvV3BUEcfzknX2DJtsO+4ji+YUIhmzoOE81ypvPHRPnaQXHhMLTY848Mek7Q5sGn8X5VM3YMhjY0Mg3S97x8NHLY2Sq4lYoJMoM0/0ZtVvvHDLOD54/YuQKmJWwoV+ugoAKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726247587; c=relaxed/simple;
	bh=8tP1tlr6C/dPtbD7yFTdG1g6YGA0tr9nJ+PCUlfMW1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEm3zrY1GYNPlxbX8rX21W8LLgis/CE1QhvSeqi09QWSz2GlYL6xVsWyI7/3k7Vq8Om67ogfsjynafuesJnle7HFmzLZMqNftMX7w/FhVt+28tnC2SsSWHorCrou2B4pl9UOnVS1GD+pxE7MCqIncNu5rZE/n3/I/xQeXCeI9cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com; spf=pass smtp.mailfrom=motorola.com; dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b=nTqX48mF; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorola.com
Received: from pps.filterd (m0355092.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DFLIsE027712;
	Fri, 13 Sep 2024 17:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM202306; bh=Y5WFqaMmufXCYhqBNmnwFUQ
	UawZWXxrvsGe/a2nOfpY=; b=nTqX48mFdk1DZhwyaz6WVngbV1HFCXMRIxbqjSJ
	HDnfcoTisP4RfP4/AhYZdmEdQRSR7IXS1YTAZ7KZXvAq5SZT5NZNDvyLqgMRLVa2
	Bzg3EcuqCJ6jgCYYxT/ZsRil8ncm3DWLP4clLvxzxLJCA96r4yUXRLvTWOetI3Py
	9cmh6D5oxEtIXQpkMHhv3eC0bRFwrlMxrHvUbIG7TncOQq2W6EjktnQ5Viix16B8
	jYdMzIc/QJ6ZwgHYe/g+bFKVtjlMrddf3sim6OLrWck+OGXLpsNHrf5lut7z1hd5
	Kq3TCOQlKbv+DfYELbXFPu/KSuZALuyk2DwscrQSUpTEE9A==
Received: from va32lpfpp03.lenovo.com ([104.232.228.23])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 41h55cp7v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 17:12:39 +0000 (GMT)
Received: from ilclmmrp02.lenovo.com (ilclmmrp02.mot.com [100.65.83.26])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by va32lpfpp03.lenovo.com (Postfix) with ESMTPS id 4X518Q6g0qz51Q9v;
	Fri, 13 Sep 2024 17:12:38 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by ilclmmrp02.lenovo.com (Postfix) with ESMTPSA id 4X518Q4w63z3npb3;
	Fri, 13 Sep 2024 17:12:38 +0000 (UTC)
Date: Fri, 13 Sep 2024 12:12:37 -0500
From: Maxwell Bland <mbland@motorola.com>
To: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Neill Kapron <nkapron@google.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Andrew Wheeler <awheeler@motorola.com>,
        Sammy BS2 Que <quebs2@motorola.com>, Todd Kjos <tkjos@google.com>,
        Viktor Martensson <vmartensson@google.com>,
        Andy Lutomirski <luto@amacapital.net>,
        "keescook@chromium.org" <keescook@chromium.org>,
        Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        kernel-team <kernel-team@android.com>, adelva@google.com,
        jeffv@google.com
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
Message-ID: <wl5ybbe57ec4dfz2hevt6tlw4f6z3d7hosafjpvji6wdyseo4v@xzl4yhymfkjh>
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
 <ZuNVqvVgXLjNXS5Y@google.com>
 <CANP3RGfez2onSLVT2wC1hsSmKGxD9aFdV3we3Zsngw0BgbeGyw@mail.gmail.com>
 <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
X-Proofpoint-GUID: -lL8TYtnGO4KwBPj9-xf7s9GzSpAfovf
X-Proofpoint-ORIG-GUID: -lL8TYtnGO4KwBPj9-xf7s9GzSpAfovf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130122

Here's that main.c from my prior reply sent via neomutt (outlook wraps
plaintext messages at 80 chars), if you want to check it out and don't
want to fix the random newlines:

// SPDX-License-Identifier: GPL-2.0
/*
 * Copyright (C) 2023 Motorola Mobility, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * Kernel module that hooks the vmalloc infrastructure to ensure that code
 * pages are not interleaved with data pages unless at a PMD level granularity.
 * Must be loaded prior to other kernel mechanisms leveraging code page
 * allocation, e.g. BPF, EROFS fixmap.
 */


#include <linux/kernel.h>
#include <linux/bpf.h>
#include <linux/mutex.h>
#include <linux/atomic.h>
#include <linux/highmem.h>
#include <linux/kprobes.h>
#include <linux/list.h>
#include <linux/mm_types.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/of_platform.h>
#include <linux/pagewalk.h>
#include <linux/types.h>
#include <linux/moduleloader.h>
#include <linux/vmalloc.h>
#include <linux/gfp_types.h>
#include <linux/seccomp.h>
#include <asm/pgalloc.h>
#include <asm/ptrace.h>
#include <asm/patching.h>
#include <asm/module.h>
#include <asm/page.h>
#include <asm/seccomp.h>

#ifdef SECCOMP_ARCH_NATIVE                                          
/**                                                                 
 * struct action_cache - per-filter cache of seccomp actions per    
 * arch/syscall pair                                                
 *                                                                  
 * @allow_native: A bitmap where each bit represents whether the    
 *                filter will always allow the syscall, for the     
 *                native architecture.                              
 * @allow_compat: A bitmap where each bit represents whether the    
 *                filter will always allow the syscall, for the     
 *                compat architecture.                              
 */                                                                 
struct action_cache {                                               
        DECLARE_BITMAP(allow_native, SECCOMP_ARCH_NATIVE_NR);       
#ifdef SECCOMP_ARCH_COMPAT                                          
        DECLARE_BITMAP(allow_compat, SECCOMP_ARCH_COMPAT_NR);       
#endif                                                              
};                                                                  
#else                                                               
struct action_cache { };                                            
#endif

struct seccomp_filter {             
        refcount_t refs;            
        refcount_t users;           
        bool log;                   
        bool wait_killable_recv;    
        struct action_cache cache;  
        struct seccomp_filter *prev;
        struct bpf_prog *prog;      
        struct notification *notif; 
        struct mutex notify_lock;   
        wait_queue_head_t wqh;      
};                                  



void print_bpf_prog_aux(struct bpf_prog_aux *aux) {
        printk("BPF Program Aux Details:\n");
        printk("Ref Count: %lld\n", atomic64_read(&aux->refcnt));
        printk("Used Map Count: %u\n", aux->used_map_cnt);
        printk("Used BTF Count: %u\n", aux->used_btf_cnt);
        printk("Max Context Offset: %u\n", aux->max_ctx_offset);
        printk("Max Packet Offset: %u\n", aux->max_pkt_offset);
        printk("Max TP Access: %u\n", aux->max_tp_access);
        printk("Stack Depth: %u\n", aux->stack_depth);
        printk("ID: %u\n", aux->id);
        printk("Function Count: %u\n", aux->func_cnt);
        printk("Function Index: %u\n", aux->func_idx);
        printk("Attach BTF ID: %u\n", aux->attach_btf_id);
        printk("Context Arg Info Size: %u\n", aux->ctx_arg_info_size);
        printk("Max Read-Only Access: %u\n", aux->max_rdonly_access);
        printk("Max Read-Write Access: %u\n", aux->max_rdwr_access);
        printk("Attach BTF: %p\n", aux->attach_btf);
        printk("Context Arg Info: %p\n", aux->ctx_arg_info);
        printk("DST Mutex: %p\n", &aux->dst_mutex);
        printk("DST Program: %p\n", aux->dst_prog);
        printk("DST Trampoline: %p\n", aux->dst_trampoline);
        printk("Saved DST Program Type: %d\n", aux->saved_dst_prog_type);
        printk("Saved DST Attach Type: %d\n", aux->saved_dst_attach_type);
        printk("Verifier Zero Extension: %u\n", aux->verifier_zext);
        printk("Attach BTF Trace: %u\n", aux->attach_btf_trace);
        printk("Function Proto Unreliable: %u\n", aux->func_proto_unreliable);
        printk("Sleepable: %u\n", aux->sleepable);
        printk("Tail Call Reachable: %u\n", aux->tail_call_reachable);
        printk("XDP Has Frags: %u\n", aux->xdp_has_frags);
        printk("Attach Func Proto: %p\n", aux->attach_func_proto);
        printk("Attach Func Name: %s\n", aux->attach_func_name);
        printk("Functions: %p\n", aux->func);
        printk("JIT Data: %p\n", aux->jit_data);
        printk("Poke Table: %p\n", aux->poke_tab);
        printk("Kfunc Table: %p\n", aux->kfunc_tab);
        printk("Kfunc BTF Table: %p\n", aux->kfunc_btf_tab);
        printk("Size Poke Table: %u\n", aux->size_poke_tab);
        printk("Ksym: %p\n", &aux->ksym);
        printk("Operations: %p\n", aux->ops);
        printk("Used Maps: %p\n", aux->used_maps);
        printk("Used Maps Mutex: %p\n", &aux->used_maps_mutex);
        printk("Used BTFs: %p\n", aux->used_btfs);
        printk("Program: %p\n", aux->prog);
        printk("User: %p\n", aux->user);
        printk("Load Time: %llu\n", aux->load_time);
        printk("Verified Instructions: %u\n", aux->verified_insns);
        printk("Cgroup Attach Type: %d\n", aux->cgroup_atype);
        printk("Cgroup Storage: %p\n", aux->cgroup_storage);
        printk("Name: %s\n", aux->name);
}

void print_bpf_prog_insnsi(struct bpf_insn * insns, uint64_t len) {
        int i;
        for (i = 0; i < len; i++) {                     
                const struct bpf_insn *insn = &insns[i];
                printk("BPF INSN %016llx\n", *((uint64_t *)insn));
        }
}

void print_bpf_prog(struct bpf_prog *prog) {
        printk("BPF Program Details:\n");
        printk("Pages: %u\n", prog->pages);
        printk("JITed: %u\n", prog->jited);
        printk("JIT Requested: %u\n", prog->jit_requested);
        printk("GPL Compatible: %u\n", prog->gpl_compatible);
        printk("Control Block Access: %u\n", prog->cb_access);
        printk("DST Needed: %u\n", prog->dst_needed);
        printk("Blinding Requested: %u\n", prog->blinding_requested);
        printk("Blinded: %u\n", prog->blinded);
        printk("Is Function: %u\n", prog->is_func);
        printk("Kprobe Override: %u\n", prog->kprobe_override);
        printk("Has Callchain Buffer: %u\n", prog->has_callchain_buf);
        printk("Enforce Expected Attach Type: %u\n", prog->enforce_expected_attach_type);
        printk("Call Get Stack: %u\n", prog->call_get_stack);
        printk("Call Get Func IP: %u\n", prog->call_get_func_ip);
        printk("Timestamp Type Access: %u\n", prog->tstamp_type_access);
        printk("Type: %d\n", prog->type);
        printk("Expected Attach Type: %d\n", prog->expected_attach_type);
        printk("Length: %u\n", prog->len);
        printk("JITed Length: %u\n", prog->jited_len);
        printk("Tag: ");
        for (int i = 0; i < BPF_TAG_SIZE; i++) {
                printk("%02x", prog->tag[i]);
        }
        printk("\n");
        printk("Stats: %p\n", prog->stats);
        printk("Active: %p\n", prog->active);
        printk("AUX FIELDS:\n");
        print_bpf_prog_aux(prog->aux);
        print_bpf_prog_insnsi(prog->insnsi, prog->len);
}


/* Functions we need for patching dynamic code allocations */
typedef void *(*module_alloc_t)(unsigned long size);
module_alloc_t module_alloc_ind;
typedef void (*module_memfree_t)(void *module_region);
module_memfree_t module_memfree_ind;

/* TODO: actually we could probably just include "net/bpf_jit.h" */
typedef int (*aarch64_insn_patch_text_nosync_t)(void *addr, u32 insn);
aarch64_insn_patch_text_nosync_t aarch64_insn_patch_text_nosync_ind;
typedef u32 (*aarch64_insn_gen_branch_imm_t)(unsigned long pc,
                                             unsigned long addr,
enum aarch64_insn_branch_type type);
aarch64_insn_gen_branch_imm_t aarch64_insn_gen_branch_imm_ind;
typedef u32 (*aarch64_insn_gen_hint_t)(enum aarch64_insn_hint_cr_op op);
aarch64_insn_gen_hint_t aarch64_insn_gen_hint_ind;
typedef u32 (*aarch64_insn_gen_branch_reg_t)(
        enum aarch64_insn_register reg, enum aarch64_insn_branch_type type);
aarch64_insn_gen_branch_reg_t aarch64_insn_gen_branch_reg_ind;
typedef void *(*__vmalloc_node_range_t)(unsigned long size, unsigned long align,
                                        unsigned long start, unsigned long end,
                                        gfp_t gfp_mask, pgprot_t prot,
                                        unsigned long vm_flags, int node,
const void *caller);
__vmalloc_node_range_t __vmalloc_node_range_ind;

/* Used for reworking the kprobe allocator */
typedef int (*collect_garbage_slots_t)(struct kprobe_insn_cache *c);
collect_garbage_slots_t collect_garbage_slots_ind;

static struct kprobe kallsyms_lookup_name_kp = { .symbol_name =
        "kallsyms_lookup_name",
.addr = 0 };
typedef unsigned long (*kallsyms_lookup_name_t)(const char *name);
kallsyms_lookup_name_t kallsyms_lookup_name_ind;

/* Functions we are patching */
static struct kprobe alloc_vmap_area_kp = { .symbol_name = "alloc_vmap_area",
.addr = 0 };

/* DEBUG: bpf allocation printing */
// static struct kprobe bpf_int_jit_compile_kp = { .symbol_name = "bpf_int_jit_compile",
// .addr = 0 };
static struct kprobe ptrace_request_kp = { .symbol_name = "ptrace_request",
.addr = 0 };
/* END DEBUG */

/* Static variables that must be manually accessed for definition */
u64 module_alloc_base;
struct kprobe_insn_cache *kprobe_insn_slots_ptr;

/**
 * get_kp_addr - TODO comment rest of file
 */
static __always_inline void *get_kp_addr(struct kprobe *kp)
{
        void *res = 0;
        if (register_kprobe(kp)) {
                pr_err("Error: moto_org_mem failed to get kp addr for %s\n",
                       kp->symbol_name);
                return 0;
        }
        res = kp->addr;
        unregister_kprobe(kp);
        return res;
}

static void *bpf_jit_alloc_exec_handler(unsigned long size)
{
        return module_alloc_ind(size);
}

static void bpf_jit_free_exec_handler(void *addr)
{
        module_memfree_ind(addr);
}

static u64 bpf_jit_alloc_exec_limit_handler(void)
{
        return MODULES_END - MODULES_VADDR;
}

static void *alloc_insn_page_handler(void)
{
        return __vmalloc_node_range_ind(PAGE_SIZE, 1, module_alloc_base,
                                        module_alloc_base + SZ_2G, GFP_KERNEL,
                                        PAGE_KERNEL_ROX, VM_FLUSH_RESET_PERMS,
                                        NUMA_NO_NODE,
        __builtin_return_address(0));
}

static bool allocation_balance = false;

/**
 * alloc_vmap_area_pre_handler - adjusts vstart, vend to not interleave code/data
 *
 * Right now, vmalloc infrastructure does the following:
 * |<-----data----->||<-----code and data pages----->||<-----data----->|
 * Maintainers likely do not want to touch vmalloc internals for fear of
 * breaking everything, so we provide an open-source work-around with hopes
 * that these fixes will make their way into the mainline kernel.
 *
 * We adjust the parameters to the call to avoid the code memory range by
 * selecting the lower half, then in a separate post handler, we check whether
 * the allocation failed, and if so, run the allocation with the upper half.
 *
 * TODO: we need to remove the flip/flopping and properly segment the memory
 * here, but it is not clear how to do this without modifying core vmalloc
 * infrastructure. See upstream patch here:
 * https://lore.kernel.org/all/20240423095843.446565600-1-mbland@motorola.com/#t
 *
 * Parameters are passed in the arm64 linux kernel following the AAPCS64 ABI 
 * convention, and thus it is safe to interpolate based upon the signature
 * the location of the specific values for vstart and vend.
 * https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst
 */
static int alloc_vmap_area_handler(struct kprobe *kp, struct pt_regs *regs)
{
        unsigned long size;
        unsigned long vstart;
        size = regs->regs[0];
        vstart = regs->regs[2];
        if (vstart == VMALLOC_START) { /* We are attempting to vmalloc data */
                /* Everything is fine, do nothing */
                if (module_alloc_base + SZ_2G <= VMALLOC_START ||
                        module_alloc_base > VMALLOC_END)
                return 0;

                allocation_balance = !allocation_balance;

                /* Not enough room below, else if not enough room above */
                if (module_alloc_base - VMALLOC_START < size)
                        allocation_balance = true;
                        else if (VMALLOC_END - module_alloc_base + SZ_2G < size)
                        allocation_balance = false;

                /* Allocate from higher valued addresses or lower valued
                 * address evenly. since these are virtual it does not 
                 * really matter */
                if (allocation_balance) {
                        regs->regs[2] = module_alloc_base + SZ_2G;
                } else {
                        regs->regs[3] = module_alloc_base;
                }
        }

        return 0;
}

/* DEBUG: Analyze allocated BPF programs */
// static int bpf_int_jit_compile_handler(struct kprobe *kp, struct pt_regs *regs)
// {
//         // struct bpf_prog *prog = (struct bpf_prog *)regs->regs[0];
//         // print_bpf_prog(prog);
//         return 0;
// }
// 
static int ptrace_request_handler(struct kprobe *kp, struct pt_regs *regs)
{
        struct task_struct *task = (struct task_struct *)regs->regs[0];
        long request = regs->regs[1];
        unsigned long addr = regs->regs[2];
        struct seccomp_filter *filter;                                      
        if (request != 0x420c) {
                return 0;
        }
        if (addr != 13371337) {
                printk("waiting for regs ... %llx\n", regs->regs[1]);
                return 0;
        }
                                                                            
        if (!task)
        {
                printk("ptrace_request_handler no task\n");
                return 0;
        }
                                                                            
        filter = READ_ONCE(task->seccomp.filter);
        printk("TASK PID %d or %d\n", task->pid, pid_vnr(task_pgrp(task)));
        if (!filter) {
                printk("ptrace_request_handler no filter\n");
                return 0;
        }
        if (filter->prog)
                print_bpf_prog(filter->prog);

        return 0;
}
/* END DEBUG */


void __always_inline patch_jump_to_handler(void *faddr, void *helper)
{
        u32 insn;
        insn = aarch64_insn_gen_branch_imm_ind((unsigned long)faddr,
                                               (unsigned long)helper,
        AARCH64_INSN_BRANCH_NOLINK);
        aarch64_insn_patch_text_nosync_ind(faddr, insn);
}

struct kprobe_insn_page {
        struct list_head list;
        kprobe_opcode_t *insns; /* Page of instruction slots */
        struct kprobe_insn_cache *cache;
        int nused;
        int ngarbage;
        char slot_used[];
};

void free_insn_pages(struct kprobe_insn_cache *kic)
{
        struct kprobe_insn_page *kip;
        unsigned int i = 0;

        /* TODO: Since the slot array is not protected by rcu, we need a mutex,
         * but we are also should be the only thing running that is touching
         * the kprobes */
        list_for_each_entry_rcu (kip, &kic->pages, list) {
                for (i = 0; i < kip->nused; i++) {
                        kip->slot_used[i] = 0;
                        kip->nused--;
                }
                list_del_rcu(&kip->list);
                synchronize_rcu();
                kip->cache->free(kip->insns);
                kfree(kip);
        }
}

/**
 * mod_init - TODO
 *
 * TODO FAIL IF ANY OF THE BELOW FAILS
 */
static int __init mod_init(void)
{
        void *bpf_jit_alloc_exec_addr = 0;
        void *bpf_jit_free_exec_addr = 0;
        void *bpf_jit_alloc_exec_limit_addr = 0;
        void *alloc_insn_page_addr = 0;
        kallsyms_lookup_name_ind =
                (kallsyms_lookup_name_t)get_kp_addr(&kallsyms_lookup_name_kp);

        module_alloc_ind =
                (module_alloc_t)kallsyms_lookup_name_ind("module_alloc");
        module_memfree_ind =
                (module_memfree_t)kallsyms_lookup_name_ind("module_memfree");
        __vmalloc_node_range_ind =
                (__vmalloc_node_range_t)kallsyms_lookup_name_ind(
                        "__vmalloc_node_range");
        aarch64_insn_patch_text_nosync_ind =
                (aarch64_insn_patch_text_nosync_t)kallsyms_lookup_name_ind(
                        "aarch64_insn_patch_text_nosync");
        aarch64_insn_gen_branch_imm_ind =
                (aarch64_insn_gen_branch_imm_t)kallsyms_lookup_name_ind(
                        "aarch64_insn_gen_branch_imm");
        aarch64_insn_gen_hint_ind =
                (aarch64_insn_gen_hint_t)kallsyms_lookup_name_ind(
                        "aarch64_insn_gen_hint");
        aarch64_insn_gen_branch_reg_ind =
                (aarch64_insn_gen_branch_reg_t)kallsyms_lookup_name_ind(
                        "aarch64_insn_gen_branch_reg");

        collect_garbage_slots_ind =
                (collect_garbage_slots_t)kallsyms_lookup_name_ind(
                        "collect_garbage_slots");

        bpf_jit_alloc_exec_addr =
                (void *)kallsyms_lookup_name_ind("bpf_jit_alloc_exec");
        bpf_jit_free_exec_addr =
                (void *)kallsyms_lookup_name_ind("bpf_jit_free_exec");
        bpf_jit_alloc_exec_limit_addr =
                (void *)kallsyms_lookup_name_ind("bpf_jit_alloc_exec_limit");
        alloc_insn_page_addr =
                (void *)kallsyms_lookup_name_ind("alloc_insn_page");

        module_alloc_base =
                *((u64 *)kallsyms_lookup_name_ind("module_alloc_base"));

        patch_jump_to_handler(bpf_jit_alloc_exec_addr,
                              bpf_jit_alloc_exec_handler);
        patch_jump_to_handler(bpf_jit_free_exec_addr,
                              bpf_jit_free_exec_handler);
        patch_jump_to_handler(bpf_jit_alloc_exec_limit_addr,
                              bpf_jit_alloc_exec_limit_handler);
        patch_jump_to_handler(alloc_insn_page_addr, alloc_insn_page_handler);

        /*
         * Under the hood, arm64 calls __get_insn_slot to generate memory pages for
         * kprobes, and these memory pages *supposedly* access an indirect pointer to
         * their allocation function through kprobe_insn_slots. Because we allocated
         * a kprobe in order to access kallsyms_lookup_name, one page is already allocated.
         * However, even kprobe garbage collection cowardly refuses to kill the last page,
         * so we have our own free routine that nixes that last survivor.
         */
        kprobe_insn_slots_ptr =
                (struct kprobe_insn_cache *)kallsyms_lookup_name_ind(
        "kprobe_insn_slots");
        free_insn_pages(kprobe_insn_slots_ptr);

        alloc_vmap_area_kp.pre_handler = alloc_vmap_area_handler;
        if (register_kprobe(&alloc_vmap_area_kp)) {
                pr_err("moto_org_mem.ko failed to hook alloc_vmap_area!\n");
                return -EACCES;
        }

        /* DEBUG */
        // bpf_int_jit_compile_kp.pre_handler = bpf_int_jit_compile_handler;
        // if (register_kprobe(&bpf_int_jit_compile_kp)) {
        //         pr_err("moto_org_mem.ko failed to hook bpf_int_jit_compile!\n");
        //         return -EACCES;
        // }

        ptrace_request_kp.pre_handler = ptrace_request_handler;
        if (register_kprobe(&ptrace_request_kp)) {
                pr_err("moto_org_mem.ko failed to hook ptrace_request_kp!\n");
                return -EACCES;
        }

        /* END DEBUG */
        pr_info("moto_org_mem loaded!\n");

        return 0;
}

static void __exit mod_exit(void)
{
}

module_init(mod_init);
module_exit(mod_exit);

MODULE_LICENSE("GPL v2");
MODULE_AUTHOR("Maxwell Bland <mbland@motorola.com>");
MODULE_DESCRIPTION("Organizes the vmalloc memory code pages are not interleaved "
                   "with data pages.");


